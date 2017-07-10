class SurveyController < ApplicationController
  def index
    @questions = Question.order(:order)
  end
end
