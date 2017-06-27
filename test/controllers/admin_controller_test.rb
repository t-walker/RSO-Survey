require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_url
    assert_response :success
  end

  test "should get manage" do
    get admin_manage_url
    assert_response :success
  end
end
