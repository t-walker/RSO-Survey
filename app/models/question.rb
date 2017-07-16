class Question < ApplicationRecord
  validates :answers, presence: true
  has_many :answers
end
