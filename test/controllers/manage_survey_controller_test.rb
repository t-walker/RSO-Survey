require 'test_helper'

class ManageSurveyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manage_survey_url
    assert_response :success
  end

end
