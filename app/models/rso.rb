class Rso < ApplicationRecord
  has_and_belongs_to_many :keywords
  has_and_belongs_to_many :officers
  validates :name, :presence => true
  validates_length_of :name, :maximum => 255
  validates :nickname, :presence => true
  validates_length_of :nickname, :maximum => 50

end
