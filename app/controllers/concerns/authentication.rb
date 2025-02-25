module Authentication
  def sign_in(user)
    db_session = user.sessions.create!
    cookies.signed.permanent[:session_id] = { value: db_session.id, httponly: true }
  end

  def sign_out
    session_from_cookies.destroy!
    cookies.delete(:session_id)
  end

  def require_authentication
    restore_authentication || request_authentication
  end

  def restore_authentication
    if db_session = session_from_cookies
      Current.user = db_session.user
      Current.organization = db_session.organization
      db_session
    end
  end

  def request_authentication
    redirect_to new_session_path, notice: "You must be signed in to perform that action"
  end

  def session_from_cookies
    Session.find_by(id: cookies.signed[:session_id])
  end

  def redirect_if_signed_in
    if restore_authentication
      redirect_to root_path, notice: "You are already signed in"
    end
  end

  def require_organization
    return if session_from_cookies.organization.present?

    redirect_to organizations_path, notice: "Please select an organization."
  end

  def set_current_organization(organization)
    session_from_cookies.update!(organization: organization)
    Current.organization = organization
  end

  def require_access
    require_authentication && require_organization
  end
end
