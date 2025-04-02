require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "should create user" do
    visit signup_url

    within("form") do
      fill_in "Email", with: "new@example.com"
      fill_in "Password", with: default_password
      click_on "Sign up"
    end

    assert_text "User was successfully created"
  end

  test "should update User" do
    login_as(@user)
    visit edit_user_url(@user)

    fill_in "Email", with: @user.email
    fill_in "Password", with: default_password
    click_on "Update"

    assert_text "User was successfully updated"
  end
end
