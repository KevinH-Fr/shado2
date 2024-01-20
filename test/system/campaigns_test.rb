require "application_system_test_case"

class CampaignsTest < ApplicationSystemTestCase
  setup do
    @campaign = campaigns(:one)
  end

  test "visiting the index" do
    visit campaigns_url
    assert_selector "h1", text: "Campaigns"
  end

  test "should create campaign" do
    visit campaigns_url
    click_on "New campaign"

    fill_in "Athlete", with: @campaign.athlete_id
    fill_in "Description", with: @campaign.description
    fill_in "End", with: @campaign.end
    fill_in "Periodicity", with: @campaign.periodicity
    fill_in "Start", with: @campaign.start
    fill_in "Subscription", with: @campaign.subscription
    fill_in "Target", with: @campaign.target
    fill_in "Thankyounote", with: @campaign.thankyounote
    fill_in "Title", with: @campaign.title
    click_on "Create Campaign"

    assert_text "Campaign was successfully created"
    click_on "Back"
  end

  test "should update Campaign" do
    visit campaign_url(@campaign)
    click_on "Edit this campaign", match: :first

    fill_in "Athlete", with: @campaign.athlete_id
    fill_in "Description", with: @campaign.description
    fill_in "End", with: @campaign.end
    fill_in "Periodicity", with: @campaign.periodicity
    fill_in "Start", with: @campaign.start
    fill_in "Subscription", with: @campaign.subscription
    fill_in "Target", with: @campaign.target
    fill_in "Thankyounote", with: @campaign.thankyounote
    fill_in "Title", with: @campaign.title
    click_on "Update Campaign"

    assert_text "Campaign was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign" do
    visit campaign_url(@campaign)
    click_on "Destroy this campaign", match: :first

    assert_text "Campaign was successfully destroyed"
  end
end
