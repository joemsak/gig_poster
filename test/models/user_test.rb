require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email must be present" do
    user = users(:blank_email)
    assert_not user.valid?
    assert_equal [ "can't be blank" ], user.errors[:email]
  end

  test "password must be present" do
    user = users(:blank_password)
    assert_not user.valid?
    assert_equal [ "can't be blank" ], user.errors[:password]
  end

  test "password must be strong" do
    user = users(:weak_password)
    assert_not user.valid?
    assert_equal [
      "must be at least 8 characters",
      "must contain at least 1 number",
      "must contain at least 1 symbol" 
    ], user.errors[:password]
  end
end
