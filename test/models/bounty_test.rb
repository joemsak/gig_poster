require "test_helper"

class BountyTest < ActiveSupport::TestCase
  test "title must be present" do
    bounty = bounties(:missing_title)
    assert_not bounty.valid?
    assert [ "can't be blank" ], bounty.errors[:title]
  end

  test "amount must be present" do
    bounty = bounties(:missing_amount)
    assert_not bounty.valid?
    assert_equal [ "can't be blank", "is not a number" ], bounty.errors[:amount]
  end

  test "amount must be greater than 0" do
    bounty = bounties(:zero_amount)
    assert_not bounty.valid?
    assert_equal [ "must be greater than 0" ], bounty.errors[:amount]
  end
end
