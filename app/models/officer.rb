class Officer < ApplicationRecord
  has_many :officer_rsos
  has_many :rsos, through: :officer_rsos

  def full_name
    first + " " + last
  end
end
