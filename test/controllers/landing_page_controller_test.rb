require 'test_helper'

class LandingPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get landing_page_url
    assert_response :success
  end

end
