class EpicsController < ApplicationController
  before_action :set_epic, only: %i[
    show
    edit
    update
    destroy
  ]

  layout "dashboard"

  def index
    @epics = Epic.includes(:project)
                 .order(created_at: :desc)
  end

  def show
  end

  def new
    @epic = Epic.new
  end

  def create
    @epic = Epic.new(epic_params)

    if @epic.save
      redirect_to epics_path,
                  notice: "Epic created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @epic.update(epic_params)
      redirect_to epics_path,
                  notice: "Epic updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @epic.destroy

    redirect_to epics_path,
                notice: "Epic deleted successfully."
  end

  private

  def set_epic
    @epic = Epic.find(params[:id])
  end

  def epic_params
    params.require(:epic)
          .permit(
            :title,
            :description,
            :project_id
          )
  end
end
