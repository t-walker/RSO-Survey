class SurveyController < ApplicationController
  def index
    @questions = Question.order(:order)
  end
  def createQuestion
    @question = Question.create(question: params[:question])
    @question.order = @question.id
    @question.save!
    nextOrder = 0
    if(params[:answer1] != "")
      nextOrder += 1
      @question.answers.create(answer: params[:answer1], order: nextOrder)
    end
    if(params[:answer2] != "")
      nextOrder += 1
      @question.answers.create(answer: params[:answer2], order: nextOrder)
    end
    if(params[:answer3] != "")
      nextOrder += 1
      @question.answers.create(answer: params[:answer3], order: nextOrder)
    end
    if(params[:answer4] != "")
      nextOrder += 1
      @question.answers.create(answer: params[:answer4], order: nextOrder)
    end

  end
end
