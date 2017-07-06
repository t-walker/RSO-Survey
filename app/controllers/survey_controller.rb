class SurveyController < ApplicationController
  def index
    @questionList = Question.all
    #@questions = [{:title => "How large is your hometown?", :answers => ["big", "small", "medium"]}, {:title => "How large is your hometown?", :answers => ["big", "small", "medium"]}]
    @questionList.all.each do |theQuestion|
      theQuestion.answers = Answer.where(question_id: theQuestion.id)
    end
    #puts @questionList[0].answers
  end
end
