require 'test_helper'

class RsoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rso_url
    assert_response :success
  end

  test "should get manage" do
    get rso_manage_url
    assert_response :success
  end
end
