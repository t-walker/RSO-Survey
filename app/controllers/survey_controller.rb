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
      lastPosition = 0
      if(Question.exists?)
        lastPosition = Question.all.order(position: :desc).first.position
      end
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

  def edit_keyword
    keyword = Keyword.find(params[:keyword_id])
    old_keyword = keyword.keyword
    keyword.update(keyword: params[:keyword], weight: params[:weight])
    if(keyword.valid?)
      keyword.save!
      keywords_to_update = Keyword.where(keyword: old_keyword)
      keywords_to_update.each do |k|
        k.update(keyword: params[:keyword])
        k.save!
      end
      flash[:success] = "Keyword updated successfully"
    else
      flash[:error] = "Keyword not updated: " + keyword.errors.full_messages.join(", ")
    end
    redirect_to controller: 'survey', action: 'edit_question', id: params[:question_id]
  end

  def delete_keyword
    keyword = Keyword.find(params[:keyword_id])
    keyword.destroy
    if(keyword.destroyed?)
      flash[:success] = "Keyword deleted successfully!"
    else
      flash[:error] = "Keyword not deleted: " + keyword.errors.full_messages.join(", ")
    end

    redirect_to controller: 'survey', action: 'edit_question', id: params[:question_id]
  end

  def submit
    response = Response.create()
    if(params["question"])
      params["question"].keys.each do |q|
        response.answers << Answer.find(params["question"][q])
      end
      user_keywords = {}
      response.answers.each do |a|
        answer_weight_sum = a.keywords.sum(:weight)
        a.keywords.each do |k|
          user_keywords[k.keyword] = k.weight.to_f / answer_weight_sum
        end
      end
      rso_keywords = {}
      rsos = Rso.all
      rsos.each do |r|
        rso_keywords[r.id] = {}
        keyword_weight_sum = r.keywords.sum(:weight)
        # normalize keyword weights so they are relative within the RSO
        r.keywords.each do |k|
          rso_keywords[r.id][k.keyword] = k.weight.to_f / keyword_weight_sum
        end
      end
      rso_match_strengths = {}
      rso_keywords.keys.each do |rso_id|
        rso_match_strengths[rso_id] = 0
        rso_keywords[rso_id].keys.each do |keyword|
          if(user_keywords.key?(keyword))
            rso_keywords[rso_id][keyword] = rso_keywords[rso_id][keyword] * user_keywords[keyword]
            rso_match_strengths[rso_id] += rso_keywords[rso_id][keyword]
          end
        end
      end

      # Rank the matches from highest to lowest.
      rso_match_strengths = rso_match_strengths.sort_by{ |rso_id, strength| strength}.reverse

      i = 0
      if(rso_match_strengths[i][1] == 0.to_f)
        flash[:results] = "You didn't match with any clubs."
      else
        flash[:results] = "You matched with "
        max_matches = 5
        while i < max_matches and rso_match_strengths[i][1] > 0
          if(rso_match_strengths[i + 1][1] == 0.0 or i == max_matches - 1)
            flash[:results] += " and "
          end
          flash[:results] += Rso.find(rso_match_strengths[i][0]).name
          # Uncomment the code below to append the match strength to the results
          #flash[:results] += " (" + rso_match_strengths[i][1].to_s + ")"
          if(rso_match_strengths[i + 1][1] > 0 and i < max_matches - 1 )
            flash[:results] += ", "
          else
            flash[:results] += "."
          end
          i += 1
        end
      end
    else
      flash[:error] = "You need to answer at least one survey question. Please try again."
    end

    redirect_to action: "index"
  end
end
