class Keyword < ApplicationRecord
  validates :weight, :presence => true
  validates :keyword, :presence => true
  has_and_belongs_to_many :rsos
end
