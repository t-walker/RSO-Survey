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
     Users GroupLinux Users GroupLinux Users GroupLinux Users GroupLinux Users GroupLinux Users Group", nickname: "hello")
    assert_not rso.save, "Saved an RSO with a name longer than 255 characters"
  end

  test "should not create an RSO with a nickname longer than 50 characters" do
    # 50+ character-long nickname
    rso = Rso.create(name: "LUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUGLUG")
    assert_not rso.save, "Saved an RSO with a name longer than 255 characters"
  end

  test "should not create an RSO with two of the same officer" do
    officer = Officer.create(first: "Barack", last: "Obama")
    rso1 = Rso.create(name: "LUG", nickname: "Linux Users Group")
    rso1.officers << officer
    rso1.officers << officer
    assert_not rso1.valid?, "Saved an RSO with two of the same officer"
  end

  test "should create two RSOs with the same officer" do
    officer = Officer.create(first: "Barack", last: "Obama")
    rso1 = Rso.create(name: "Linux Users Group", nickname: "LUG")
    rso2 = Rso.create(name: "Dead Poets Society", nickname: "DPS")
    rso1.officers << officer
    rso2.officers << officer
    rso1.save!
    assert rso2.save!, "Couldn't save an RSO with an officer that is in another RSO"
  end
end
