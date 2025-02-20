require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "#new is successful when not signed in" do
    get new_session_path
    assert_response :success
  end

  test "#new redirects when user is signed in" do
    sign_in users(:john)
    get new_session_path
    assert_redirected_to root_path
  end

  # test "#create signs in the user when not signed in" do
  #   get dashboard_path
  #   assert_redirected_to new_session_path

  #   sign_in users(:john)
  #   assert_redirected_to dashboard_path

  #   get dashboard_path
  #   assert_response :success
  # end

  test "#create redirects when already signed in" do
    2.times { sign_in users(:john) }
    assert_redirected_to root_path
  end
end
