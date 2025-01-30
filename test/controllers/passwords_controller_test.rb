class PasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:john)
  end

  test "#edit" do
    get edit_password_path
    assert_response :success
  end

  test "#update with valid params updates the user's password" do
    patch password_path, params: {
      password: {
        password: "newhashone",
        password_confirmation: "newhashone",
        password_challenge: "hash_one"
      }
    }
    assert_redirected_to dashboard_path
    assert users(:john).reload.authenticate("newhashone")
  end

  test "#update with nil password challenge does not update the user's password" do
    patch password_path, params: {
      password: { password: "newhashone", password_confirmation: "newhashone" }
    }
    assert_response :unprocessable_entity
    assert_not users(:john).reload.authenticate("newhashone")
  end
end
