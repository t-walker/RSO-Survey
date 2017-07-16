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

  test "should not create question with no answers" do
    question = Question.new
    question.question_title = "What is the meaning of life?"
    assert_not question.save, "Saved question without answers"
  end
end
