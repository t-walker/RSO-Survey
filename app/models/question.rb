class Question < ApplicationRecord
  def answer_limits
    answersNumber = Answer.where(:question_id => self.id).count
    if !(answersNumber >= 2)
      errors.add(:answers, "must have 2 or more answers")
    elsif !(answersNumber <= 4)
      errors.add(:answers, "must have 4 or less answers")
    end
  end

  validates :answers, :presence => true
  validates :position, :presence => true
  validates :question_title, :presence => true
  validate :answer_limits
  has_many :answers


end
