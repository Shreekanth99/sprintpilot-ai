class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[
    show
    edit
    update
    destroy
  ]

  layout "dashboard"

  def index
    authorize Project

    @projects = Project.includes(:organization)
                       .order(created_at: :desc)
  end

  def show
    authorize @project
  end

  def new
    @project = Project.new

    authorize @project
  end

  def create
    @project = Project.new(project_params)

    authorize @project

    if @project.save
      redirect_to projects_path,
                  notice: "Project created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @project
  end

  def update
    authorize @project

    if @project.update(project_params)
      redirect_to projects_path,
                  notice: "Project updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @project

    @project.destroy

    redirect_to projects_path,
                notice: "Project deleted successfully."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project)
          .permit(:name, :description, :organization_id)
  end
end
