class Answer < ApplicationRecord
  belongs_to :question
  validates :question_id, :presence => true
  validates_inclusion_of :position, :in => 1..4
  has_many :keywords
end
