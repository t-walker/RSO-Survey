require 'test_helper'

class ManageSurveyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get survey_url
    assert_response :success
  end

  test "should get manage" do
    get survey_manage_url
    assert_response :success
  end
end
