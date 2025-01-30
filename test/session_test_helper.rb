module SessionTestHelper
  def sign_in(user)
    post session_path, params: { session: { email: user.email, password: 'hash_one' } }
  end
end