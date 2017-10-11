class Rso < ApplicationRecord
<<<<<<< HEAD
  has_and_belongs_to_many :keywords
  has_many :officer_rsos
  has_many :officers, through: :officer_rsos
=======
  has_many :rso_keywords, :dependent => :delete_all
  has_many :keywords, through: :rso_keywords, :dependent => :delete_all

  has_many :officer_rsos, :dependent => :delete_all
  has_many :officers, through: :officer_rsos, :dependent => :delete_all
>>>>>>> upstream/master

  validates :name, :presence => true
  validates_length_of :name, :maximum => 255
  validates :nickname, :presence => true
  validates_length_of :nickname, :maximum => 50
end
