class DashboardsController < ApplicationController
  before_action :require_authentication
  before_action :require_organization

  def show
    p "Session: #{Current.user.inspect}"
  end
end
