require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  fixtures :users

  setup do
    @user = users(:one)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: "valid@example.com", password: default_password } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should get edit" do
    login_as(@user)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    login_as(@user)
    patch user_url(@user), params: { user: { email: @user.email, password: default_password } }
    assert_redirected_to user_url(@user)
  end
end
