require 'test_helper'

class OfficerTest < ActiveSupport::TestCase


  test "create an officer without a first name" do
    officer = Officer.new(:last => "Obama", :email => "barack@email.com")
    assert_not officer.save, "Created an officer without a first name"
  end

  test "create an officer without a last name" do
    officer = Officer.new(:first => "Barack", :email => "barack@email.com")
    assert_not officer.save, "Created an officer without a last name"
  end

  test "create an officer without an email" do
    officer = Officer.new(:last => "Obama", :first => "Barack")
    assert_not officer.save, "Created an officer without an email"
  end
  # test "the truth" do
  #   assert true
  # end
end
