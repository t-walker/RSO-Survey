require 'test_helper'

class KeywordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not be able to create a keyword without the actual keyword" do
    keywerd = Keyword.create(weight: 5)
    assert_not keywerd.save, "Saved keyword without the actual keyword text"
  end

  test "should not be able to create a keyword without a weight" do
    keywerd = Keyword.create(keyword: "Outdoors")
    assert_not keywerd.save, "Saved keyword without the actual keyword text"
  end
end
