class TasksController < ApplicationController
  before_action :authenticate_user!

  before_action :set_task,
                only: %i[
                  show
                  edit
                  update
                  destroy
                ]

  layout "dashboard"

  def index
    @tasks = Task.includes(
      :story,
      :assignee
    ).order(created_at: :desc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path,
                  notice: "Task created successfully."
    else
      render :new,
             status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path,
                  notice: "Task updated successfully."
    else
      render :edit,
             status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_path,
                notice: "Task deleted successfully."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task)
          .permit(
            :title,
            :description,
            :status,
            :story_id,
            :assignee_id
          )
  end
end
