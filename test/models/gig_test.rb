require "test_helper"

class GigTest < ActiveSupport::TestCase
  test "title must be present" do
    gig = gigs(:missing_title)
    assert_not gig.valid?
    assert [ "can't be blank" ], gig.errors[:title]
  end

  test "bounty must be present" do
    gig = gigs(:missing_bounty)
    assert_not gig.valid?
    assert_equal [ "can't be blank", "is not a number" ], gig.errors[:bounty]
  end

  test "bounty must be a number" do
    gig = gigs(:non_numeric_bounty)
    assert_not gig.valid?
    assert_equal [ "is not a number" ], gig.errors[:bounty]
  end

  test "bounty must be greater than 0" do
    gig = gigs(:zero_bounty)
    assert_not gig.valid?
    assert_equal [ "must be greater than 0" ], gig.errors[:bounty]
  end
end
