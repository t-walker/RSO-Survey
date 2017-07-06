class SurveyController < ApplicationController
  def index
    @questionList = Question.all
    #@questions = [{:title => "How large is your hometown?", :answers => ["big", "small", "medium"]}, {:title => "How large is your hometown?", :answers => ["big", "small", "medium"]}]
    
    puts @questionList[0].question
  end
end
