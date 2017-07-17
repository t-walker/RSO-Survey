class Answer < ApplicationRecord
  belongs_to :question
  validates :question_id, :presence => true
  has_many :keywords
end
