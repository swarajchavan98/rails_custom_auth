class HomeController < ApplicationController
  def index
    if session = session_from_cookies
      Current.user = session.user
    end
  end
end
