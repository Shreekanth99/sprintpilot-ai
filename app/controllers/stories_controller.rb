class StoriesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_story,
                only: %i[
                  show
                  edit
                  update
                  destroy
                ]

  layout "dashboard"

  def index
    @stories = Story.includes(
      :epic,
      :sprint
    ).order(created_at: :desc)
  end

  def show
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      redirect_to stories_path,
                  notice: "Story created successfully."
    else
      render :new,
             status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to stories_path,
                  notice: "Story updated successfully."
    else
      render :edit,
             status: :unprocessable_entity
    end
  end

  def destroy
    @story.destroy

    redirect_to stories_path,
                notice: "Story deleted successfully."
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story)
          .permit(
            :title,
            :description,
            :story_points,
            :status,
            :epic_id,
            :sprint_id
          )
  end
end
