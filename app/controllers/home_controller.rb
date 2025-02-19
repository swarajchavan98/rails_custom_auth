class HomeController < ApplicationController
  before_action :restore_authentication
  def index
    if session = session_from_cookies
      Current.user = session.user
    end
  end
end
