class SurveyController < ApplicationController
  def index
    @questions = Question.order(:position)
  end

  def create_question
    @question = Question.create(question_title: params[:question_title])
    if(params[:position] == nil)
      @question.position = @question.id # Did this because it is currently the convention in our seed data.
    else
      @question.position = params[:position]
      @questionsAfter = Question.where("position >= ?", params[:position].to_i).order(position: :desc)
      @questionsAfter.each do |q|
        q.position += 1
      end
      @questionsAfter.each do |q|
        q.save!
      end
    end
    @question.save(:validate => false)
    nextOrder = 0

    # These if statments prevent empty answers from being created if the user wants
    # less than 4 answers to a question.
    if(params[:answer1] != "")
      nextOrder += 1
      @question.answers.create(answer_title: params[:answer1], position: nextOrder)
    end
    if(params[:answer2] != "")
      nextOrder += 1
      @question.answers.create(answer_title: params[:answer2], position: nextOrder)
    end
    if(params[:answer3] != "")
      nextOrder += 1
      @question.answers.create(answer_title: params[:answer3], position: nextOrder)
    end
    if(params[:answer4] != "")
      nextOrder += 1
      @question.answers.create(answer_title: params[:answer4], position: nextOrder)
    end
    @question.save!
    flash[:success] = "Question created successfully!"
    redirect_to action: "manage"
  end

  def manage
    @questionNum = Question.count(:question_title)
  end


  def submit_survey
  end
end
