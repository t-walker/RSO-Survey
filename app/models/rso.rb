class Rso < ApplicationRecord
  has_many :rso_keywords
  has_many :keywords, through: :rso_keywords
  
  has_many :officer_rsos
  has_many :officers, through: :officer_rsos

  validates :name, :presence => true
  validates_length_of :name, :maximum => 255
  validates :nickname, :presence => true
  validates_length_of :nickname, :maximum => 50

end
