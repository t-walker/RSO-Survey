class Keyword < ApplicationRecord
  validates :weight, :presence => true
  validates :weight, :numericality => { :greater_than_or_equal_to => 0 }
  validates :keyword, :presence => true
  belongs_to :answer

  has_and_belongs_to_many :rsos
end
