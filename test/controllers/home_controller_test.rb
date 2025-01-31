require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "#index is accessible by anyone" do
    get root_path
    assert_response :success
  end
end
