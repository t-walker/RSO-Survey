class SurveyController < ApplicationController
  def index
    @questions = Question.order(:position)
  end

  def edit_question
    @q = Question.find(params[:id])
  end

  def modify_question
    q = Question.find(params[:id])
    newPosition = params[:position].to_i
    oldPosition = q.position
    if(newPosition != nil && newPosition != oldPosition)
      lastPosition = Question.all.order(position: :desc).first.position
      # If the position submitted by the user is greater than the last position in the survey,
      # just make the question the last one in the survey.
      questionsBetween = []
      if(newPosition > lastPosition)
        newPosition = lastPosition
        questionsBetween = Question.where("position >= ?", oldPosition).order(position: :desc)
        questionsBetween.each do |q|
          q.position -= 1
        end
      else
        if(newPosition < oldPosition)
          questionsBetween = Question.where("position >= ? AND position < ?", newPosition, oldPosition).order(position: :desc)
          questionsBetween.each do |question|
            question.position += 1
          end
        else
          questionsBetween = Question.where("position > ? AND position <= ?", oldPosition, newPosition).order(position: :desc)
          questionsBetween.each do |question|
            question.position -= 1
          end
        end
      end
      questionsBetween.each do |question|
        question.save!
      end
    end
    q.update(:question_title => params[:question_title], :position => newPosition)
    if(q.valid?)
      flash[:success] = "Question updated successfully"
    else
      flash[:error] = "Question not updated: " + q.errors.full_messages.join(", ")
    end
    redirect_to controller: 'survey', action: 'edit_question', id: params[:id]
  end


  def create_question
    @question = Question.create(question_title: params[:question_title])
    if(params[:position] == "")
      # Add the question to the end of the survey
      lastPosition = Question.all.order(position: :desc).first.position
      @question.position = lastPosition + 1
    else
      lastPosition = Question.all.order(position: :desc).first.position
      puts lastPosition
      # If the position submitted by the user is greater than the last position in the survey,
      # just make the question the last one in the survey.
      if(params[:position].to_i > lastPosition)
        @question.position = lastPosition + 1
      else
        @questionsAfter = Question.where("position >= ?", params[:position].to_i).order(position: :desc)
        @questionsAfter.each do |q|
          q.position += 1
        end
        @questionsAfter.each do |q|
          q.save!
        end
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

    if(@question.valid?)
      flash[:success] = "Question created successfully!"
    else
      flash[:error] = "Question not created: " + @question.errors.full_messages.join(", ")
      @question.destroy
    end

    redirect_to action: "manage"
  end

  def manage
    @questionNum = Question.count(:question_title)
    @questions = Question.order(:position)
  end

  def add_keyword
    answer = Answer.find(params[:answer_id])
    answer.keywords.create(keyword: params[:keyword], weight: params[:weight])
    flash[:success] = "Keyword added successfully!"
    redirect_to controller: 'survey', action: 'edit_question', id: params[:question_id]
  end

  def delete_question
    question = Question.find(params[:id])
    @questionsAfter = Question.where("position >= ?", question.position).order(position: :desc)
    @questionsAfter.each do |q|
      q.position -= 1
    end
    @questionsAfter.each do |q|
      q.save!
    end

    question.destroy
    if(question.destroyed?)
      flash[:success] = "Question deleted successfully"
    else
      flash[:error] = "Question not deleted successfully: " + question.errors.full_messages.join(", ")
    end
    redirect_to action: "manage"
  end

  def delete_answer

  end

  def edit_answer
    @a = Answer.find(params[:id])
    @q = @a.question
  end

  def modify_answer
    a = Answer.find(params[:id])
    oldPosition = a.position
    newPosition = params[:position].to_i
    lastPosition = Answer.all.order(position: :desc).first.position
    answersBetween = {}
    if(newPosition > lastPosition)
      newPosition = lastPosition
    end

    if(newPosition > 4)
      newPosition = 4
    else
      if(oldPosition != nil && oldPosition != newPosition)
        if(newPosition < oldPosition)
          answersBetween = Answer.where("position >= ? AND position < ?", newPosition, oldPosition).order(position: :desc)
          answersBetween.each do |answer|
            answer.position += 1
          end
        else
          answersBetween = Answer.where("position > ? AND position <= ?", oldPosition, newPosition).order(position: :desc)
          answersBetween.each do |answer|
            answer.position -= 1
          end
        end
      end
      answersBetween.each do |answer|
        answer.save!
      end
    end
    flash[:success] = "Answer updated"
    a.update(:answer_title => params[:answer_title], :position => newPosition)
    redirect_to controller: 'survey', action: 'edit_question', id: a.question.id
  end

  def delete_keyword
    Keyword.find(params[:keyword_id]).destroy
    flash[:success] = "Keyword deleted successfully!"
    redirect_to controller: 'survey', action: 'edit_question', id: params[:question_id]
  end

  def submit
    response = Response.create()
    params["question"].keys.each do |q|
      response.answers << Answer.find(params["question"][q])
    end
    user_keywords = {}
    response.answers.each do |a|
      a.keywords.each do |k|
        user_keywords[k.keyword] = k.weight
      end
    end
    rso_keywords = {}
    rsos = Rso.all
    rsos.each do |r|
      rso_keywords[r.id] = {}
      r.keywords.each do |k|
        rso_keywords[r.id][k.keyword] = k.weight
      end
    end
    rso_match_strengths = {}
    puts rso_keywords.inspect
    puts user_keywords.inspect
    rso_keywords.keys.each do |rso_id|
      rso_match_strengths[rso_id] = 0
      rso_keywords[rso_id].keys.each do |keyword|
        if(user_keywords.key?(keyword))
          rso_keywords[rso_id][keyword] = rso_keywords[rso_id][keyword] * user_keywords[keyword]
          rso_match_strengths[rso_id] += rso_keywords[rso_id][keyword]
        end
      end
    end



    puts rso_keywords.inspect
    rso_match_strengths = rso_match_strengths.sort_by{ |rso_id, strength| strength}.reverse
    puts rso_match_strengths.inspect
    flash[:success] = "You matched with "
    for i in 0..3
      flash[:success] += Rso.find(rso_match_strengths[i][0]).name + ", "
    end
    flash[:success] += Rso.find(rso_match_strengths[4][0]).name + "."

    #
    # slope_one.insert(rso_keywords)
    # slope_one_result = slope_one.predict(user_keywords)
    # user_results = {}
    # slope_one_result.each do |k|
    #
    # puts rso_keywords.inspect
    redirect_to action: "index"
  end
end
