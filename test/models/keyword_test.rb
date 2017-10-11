require 'test_helper'

class KeywordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not be able to create a keyword without the actual keyword" do
    keyword = Keyword.create(weight: 5)
    assert_not keyword.save, "Saved keyword without the actual keyword text"
  end

  test "should not be able to create a keyword without a weight" do
    keyword = Keyword.create(keyword: "Outdoors")
    assert_not keyword.save, "Saved keyword without the actual keyword text"
  end

  test "should not be able to create a keyword with a negative weight" do
    keyword = Keyword.new
    keyword.assign_attributes(keyword: "Outdoors", weight: -5)
    assert_not keyword.save, "Saved keyword with negative weight"
  end


  test "should delete a keyword" do
    keyword = Keyword.create(keyword: "Outdoors", weight: 1)
    keyword.destroy
    assert_not Keyword.exists?(keyword.id), "Deleted keyword successfully"
  end
end
