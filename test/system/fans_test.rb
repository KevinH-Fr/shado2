require "application_system_test_case"

class FansTest < ApplicationSystemTestCase
  setup do
    @fan = fans(:one)
  end

  test "visiting the index" do
    visit fans_url
    assert_selector "h1", text: "Fans"
  end

  test "should create fan" do
    visit fans_url
    click_on "New fan"

    fill_in "Bio", with: @fan.bio
    fill_in "Pseudo", with: @fan.pseudo
    fill_in "User", with: @fan.user_id
    click_on "Create Fan"

    assert_text "Fan was successfully created"
    click_on "Back"
  end

  test "should update Fan" do
    visit fan_url(@fan)
    click_on "Edit this fan", match: :first

    fill_in "Bio", with: @fan.bio
    fill_in "Pseudo", with: @fan.pseudo
    fill_in "User", with: @fan.user_id
    click_on "Update Fan"

    assert_text "Fan was successfully updated"
    click_on "Back"
  end

  test "should destroy Fan" do
    visit fan_url(@fan)
    click_on "Destroy this fan", match: :first

    assert_text "Fan was successfully destroyed"
  end
end
