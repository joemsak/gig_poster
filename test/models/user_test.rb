require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email must be present" do
    user = users(:blank_email)
    assert_not user.valid?
    assert_equal [ "can't be blank" ], user.errors[:email]
  end

  test "email must be unique" do
    user = users(:one)

    user2 = User.new(email: user.email)
    assert_not user2.valid?
    assert_equal [ "has already been taken" ], user2.errors[:email]
  end

  test "password must be present" do
    user = users(:blank_password)
    assert_not user.valid?
    assert_equal [ "can't be blank" ], user.errors[:password]
  end

  test "password must be strong" do
    user = User.new(password: "weak")

    assert_not user.valid?
    assert_equal [ "must contain at least 1 lowercase letter, 1 uppercase letter, 1 number, 1 symbol (!, @, #, $, %, &, *), and needs to be a minimum of 8 characters." ],
      user.errors[:password]

    user = User.new(email: "user@example.com", password: "NotWeak@1234")
    assert user.valid?
  end
end
