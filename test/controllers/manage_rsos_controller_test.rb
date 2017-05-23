require 'test_helper'

class ManageRsosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manage_rsos_url
    assert_response :success
  end

end
