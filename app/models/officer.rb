class Officer < ApplicationRecord
  has_many :officer_rsos, :dependent => :delete_all
  has_many :rsos, through: :officer_rsos, :dependent => :delete_all

  validates_presence_of :first
  validates_presence_of :last
  validates_presence_of :email

  def full_name
    first + " " + last
  end
end
