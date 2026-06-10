class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization, only: %i[
    show
    edit
    update
    destroy
  ]

  layout "dashboard"

  def index
    @organizations = Organization.order(created_at: :desc)
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to organizations_path,
                  notice: "Organization created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @organization.update(organization_params)
      redirect_to organizations_path,
                  notice: "Organization updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @organization.destroy

    redirect_to organizations_path,
                notice: "Organization deleted successfully."
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization)
          .permit(:name, :slug)
  end
end
