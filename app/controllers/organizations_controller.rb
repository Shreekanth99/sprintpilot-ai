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
    authorize Organization

    @organizations = Organization.order(created_at: :desc)
  end

  def show
    authorize @organization
  end

  def new
    @organization = Organization.new

    authorize @organization
  end

  def create
    @organization = Organization.new(organization_params)

    authorize @organization

    if @organization.save
      redirect_to organizations_path,
                  notice: "Organization created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @organization
  end

  def update
    authorize @organization

    if @organization.update(organization_params)
      redirect_to organizations_path,
                  notice: "Organization updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @organization

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
