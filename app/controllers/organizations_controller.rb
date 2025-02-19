class OrganizationsController < ApplicationController
  before_action :require_authentication

  def index
    @organizations = Current.user.organizations
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.created_by = Current.user
    if @organization.save
      @organization.users << Current.user
      session[:organization_id] = @organization.id
      redirect_to dashboard_path, success: "Organization created successfully."
    else
      flash.now[:notice] = @organization.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end
end
