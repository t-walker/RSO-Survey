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

  test "should not create an RSO with a name longer than 255 characters" do
    # 300+ character-long name
    rso = Rso.create(name: "Linux Users GroupLinux Users GroupLinux Users GroupLinux
     Users GroupLinux Users GroupLinux Users GroupLinux Users GroupLinux Users
     GroupLinux Users GroupLinux Users GroupLinux Users GroupLinux Users GroupLinux
     Users GroupLinux Users GroupLinux Users GroupLinux Users GroupLinux Users GroupLinux Users Group")
    assert_not rso.save, "Saved an RSO with a name longer than 255 characters"
  end
  test "should not create an RSO with a nickname longer than 50 characters" do
    # 50+ character-long nickname
    rso = Rso.create(name: "LUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUG")
    assert_not rso.save, "Saved an RSO with a name longer than 255 characters"
  end
end
