class TeamsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_team,
                only: %i[
                  show
                  edit
                  update
                  destroy
                ]

  layout "dashboard"

  def index
    @teams = Team.includes(:organization)
                 .order(created_at: :desc)
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_path,
                  notice: "Team created successfully."
    else
      render :new,
             status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to teams_path,
                  notice: "Team updated successfully."
    else
      render :edit,
             status: :unprocessable_entity
    end
  end

  def destroy
    @team.destroy

    redirect_to teams_path,
                notice: "Team deleted successfully."
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team)
          .permit(
            :name,
            :organization_id
          )
  end
end
