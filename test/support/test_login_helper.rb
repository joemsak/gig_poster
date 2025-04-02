require "support/test_password_helper"

module TestLoginHelper
  include TestPasswordHelper

  def login_as(user)
    if defined?(post) # For controller/integration tests
      post sessions_url, params: { email: user.email, password: default_password }
    elsif defined?(visit) # For system tests (Capybara)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: default_password
      click_button 'Log in'
    else
      # For model tests or other cases, maybe stub a method
      raise "Unsupported test type for login_as"
    end
  end
end
