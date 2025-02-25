class OrganizationSelectionsController < ApplicationController
  before_action :require_authentication

  def update
    organization = Current.user.organizations.find_by(id: params[:organization_id])

    if organization
      set_current_organization(organization)
      redirect_to dashboard_path, success: "Switched to #{organization.name}."
    else
      redirect_to organizations_path, alert: "Organization not found or access denied."
    end
  end
end
