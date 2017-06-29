class SurveyController < ApplicationController
  def index
    @questions = Question.all
    #@questions = [{:title => "How large is your hometown?", :answers => ["big", "small", "medium"]}, {:title => "How large is your hometown?", :answers => ["big", "small", "medium"]}]
    puts @questions.size
  end
end
