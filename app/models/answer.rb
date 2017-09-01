class Answer < ApplicationRecord
  belongs_to :question
  validates :question_id, :presence => true
  validates :answer_title, :presence => true
  acts_as_list scope: :question

  validates_inclusion_of :position, :in => 1..4
  has_many :keywords
end
