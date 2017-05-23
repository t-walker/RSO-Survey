require 'test_helper'

class EmailResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get email_results_url
    assert_response :success
  end

end
