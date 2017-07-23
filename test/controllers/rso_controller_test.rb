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

  test "should not create an RSO without a name" do
    rso = Rso.create(nickname: "LUG")
    assert_not rso.save, "Saved an RSO without a name"
  end

  test "should not create an RSO without a nickname" do
    rso = Rso.create(name: "Linux Users Group")
    assert_not rso.save, "Saved an RSO without a nickname"
  end
end
