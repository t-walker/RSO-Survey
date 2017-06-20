class Officer < ApplicationRecord
  has_and_belongs_to_many :rsos
end
