require 'test_helper'

class AdminPrivilegesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_privileges_url
    assert_response :success
  end

end
