require "application_system_test_case"

class BountiesTest < ApplicationSystemTestCase
  setup do
    @bounty = bounties(:one)
    login_as(users(:one))
  end

  test "should create bounty" do
    visit bounties_path
    click_on "Post a bounty"

    fill_in "Amount", with: @bounty.amount
    fill_in "Title", with: @bounty.title
    click_on "Save"

    assert_text "Bounty was successfully created"
  end

  test "should update Bounty" do
    visit bounty_url(@bounty)
    click_on "Edit", match: :first

    fill_in "Amount", with: @bounty.amount
    fill_in "Title", with: @bounty.title
    click_on "Save"

    assert_text "Bounty was successfully updated"
  end

  test "should destroy Bounty" do
    visit bounty_url(@bounty)
    accept_confirm { click_on "Delete", match: :first }

    assert_text "Bounty was successfully destroyed"
  end
end
