require "application_system_test_case"

class GigsTest < ApplicationSystemTestCase
  setup do
    @gig = gigs(:one)
  end

  test "visiting the index" do
    visit root_url
    assert_selector "h1", text: "Gigs"
  end

  test "should create gig" do
    visit root_url
    click_on "New gig"

    fill_in "Bounty", with: @gig.bounty
    fill_in "Title", with: @gig.title
    click_on "Create Gig"

    assert_text "Gig was successfully created"
    click_on "Back"
  end

  test "should update Gig" do
    visit gig_url(@gig)
    click_on "Edit this gig", match: :first

    fill_in "Bounty", with: @gig.bounty
    fill_in "Title", with: @gig.title
    click_on "Update Gig"

    assert_text "Gig was successfully updated"
    click_on "Back"
  end

  test "should destroy Gig" do
    visit gig_url(@gig)
    click_on "Destroy this gig", match: :first

    assert_text "Gig was successfully destroyed"
  end
end
