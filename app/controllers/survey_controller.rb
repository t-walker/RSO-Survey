class SurveyController < ApplicationController
  def index
    @questionList = Question.order(:order)
  end
end
