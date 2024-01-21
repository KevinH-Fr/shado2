require "test_helper"

class DashboardAthleteControllerTest < ActionDispatch::IntegrationTest
  test "should get activities" do
    get dashboard_athlete_activities_url
    assert_response :success
  end

  test "should get revenues" do
    get dashboard_athlete_revenues_url
    assert_response :success
  end

  test "should get monetization" do
    get dashboard_athlete_monetization_url
    assert_response :success
  end
end
