module ApplicationHelper
  def signed_in?
    Session.find_by(id: cookies.signed[:session_id])
  end
end
