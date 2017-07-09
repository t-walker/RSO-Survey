class SurveyController < ApplicationController
  def index
    @questionList = Question.order(:order)
    @questionList.all.each do |theQuestion|
      theQuestion.answers = Answer.where(question_id: theQuestion.id)
    end
  end
end
