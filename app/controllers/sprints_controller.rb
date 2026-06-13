class SprintsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_sprint,
                only: %i[
                  show
                  edit
                  update
                  destroy
                ]

  layout "dashboard"

  def index
    @sprints = Sprint.includes(:project)
                     .order(created_at: :desc)
  end

  def show
  end

  def new
    @sprint = Sprint.new
  end

  def create
    @sprint = Sprint.new(sprint_params)

    if @sprint.save
      redirect_to sprints_path,
                  notice: "Sprint created successfully."
    else
      render :new,
             status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @sprint.update(sprint_params)
      redirect_to sprints_path,
                  notice: "Sprint updated successfully."
    else
      render :edit,
             status: :unprocessable_entity
    end
  end

  def destroy
    @sprint.destroy

    redirect_to sprints_path,
                notice: "Sprint deleted successfully."
  end

  private

  def set_sprint
    @sprint = Sprint.find(params[:id])
  end

  def sprint_params
    params.require(:sprint)
          .permit(
            :name,
            :goal,
            :status,
            :start_date,
            :end_date,
            :project_id
          )
  end
end
