class SurveyController < ApplicationController
  layout "admin"

  def index
    @questions = Question.order(:position)
    render layout: "survey"
  end

  def new_question
  end

  def edit_question
    @q = Question.find(params[:id])
  end

  # Doesn't return anything, also doesn't redirect when done
  def modify_question_position(question, new_position)
    old_position = question.position
    if(new_position != nil && new_position != old_position)
      last_position = Question.all.order(position: :desc).first.position
      # If the position submitted by the user is greater than the last position in the survey,
      # just make the question the last one in the survey.
      questions_between = []
      if(new_position > last_position)
        new_position = last_position
        questions_between = Question.where("position >= ?", old_position).order(position: :desc)
        questions_between.each do |q|
          q.position -= 1
        end
      else
        if(new_position < old_position)
          questions_between = Question.where("position >= ? AND position < ?", new_position, old_position).order(position: :desc)
          questions_between.each do |question|
            question.position += 1
          end
        else
          questions_between = Question.where("position > ? AND position <= ?", old_position, new_position).order(position: :desc)
          questions_between.each do |question|
            question.position -= 1
          end
        end
      end
      questions_between.each do |question|
        question.save!
      end
    end
    return "", ""
  end

  def update_answer_titles(answer_titles)
    answer_titles.keys.each do |answer_id|
      answer = Answer.find(answer_id)
      puts("Ran update titles for " + answer.answer_title)
      answer.assign_attributes(answer_title: answer_titles[answer_id])
      if(answer.changed?)
        if(answer.valid?)
          answer.save
          flash[:success] += "Title of answer \"" + answer.answer_title + "\" updated successfully. "
        else
          flash[:error] += "Title of answer \"" + answer.answer_title + "\" not updated successfully: " + answer.errors.full_messages.join(", ")
        end
      end
    end
    
  end


  def update_answer_positions(answer_positions)
    answer_positions.keys.each do |answer_id|
      answer = Answer.find(answer_id)
      if(answer.position != answer_positions[answer_id].to_i)
        answer.insert_at(answer_positions[answer_id].to_i)
        if(answer.changed?)
          if(answer.valid?)
            answer.save
            flash[:success] += "Position of answer \"" + answer.answer_title + "\" updated successfully. "
          else
            flash[:error] += "Position of answer \"" + answer.answer_title + "\" not updated successfully: " + answer.errors.full_messages.join(", ")
          end
        end
      end
    end
  end

  def update_keyword_titles(keyword_titles)
    if keyword_titles
      keyword_titles.keys.each do |keyword_id|
        keyword = Keyword.find(keyword_id)
        keyword.assign_attributes(keyword: keyword_titles[keyword_id])
        if(keyword.changed?)
          if(keyword.valid?)
            keyword.save
            flash[:success] += "Title of keyword \"" + keyword.keyword + "\" updated successfully. "
          else
            flash[:error] += "Title of keyword \"" + keyword.keyword + "\" not updated successfully: " + keyword.errors.full_messages.join(", ")
          end
        end
      end
    end
  end

  def update_keyword_weights(keyword_weights)
    if keyword_weights
      keyword_weights.keys.each do |keyword_id|
        keyword = Keyword.find(keyword_id)
        keyword.assign_attributes(weight: keyword_weights[keyword_id])
        if(keyword.changed?)
          if(keyword.valid?)
            keyword.save
            flash[:success] += "Weight of keyword \"" + keyword.keyword + "\" updated successfully. "
          else
            flash[:error] += "Weight of keyword \"" + keyword.keyword + "\" not updated successfully: " + keyword.errors.full_messages.join(", ")
          end
        end
      end
    end
  end


  def update_question_button(params)
    q = Question.find(params[:id])
    new_position = params[:position].to_i
    modify_question_position(q, new_position)
    # update answer titles
    update_answer_titles(params[:answer_titles])
    
    # update answer positions
    update_answer_positions(params[:answer_positions])

    # update keyword titles
    update_keyword_titles(params[:keyword_titles])
    # update keyword weights
    update_keyword_weights(params[:keyword_weights])
    q.assign_attributes(:question_title => params[:question_title], :position => new_position)
    if(q.changed?)
      if(q.valid?)
        q.save
        flash[:success] += "Question updated successfully"
      else
        flash[:error] += "Question not updated: " + q.errors.full_messages.join(", ")
      end
    end
    puts("Flash success at end of update_question_button = " + flash[:success])
  end
  
  # directs button clicks on the edit_question page to their appropriate places
  def modify_question
    flash[:success] = ""
    flash[:error] = ""
    if(params[:update_question])
      update_question_button(params)
      if(flash[:error] == "")
        flash.delete("error")
      end
      if(flash[:success] == "")
        flash.delete("success")
      end
      redirect_to controller: 'survey', action: 'edit_question', id: params[:id]
    elsif(params[:delete_question])
      delete_question_button(params)
      if(flash[:error] == "")
        flash.delete("error")
      end
      if(flash[:success] == "")
        flash.delete("success")
      end
      redirect_to action: "manage"
    elsif(params[:delete_keyword])
      delete_keyword_button(params[:delete_keyword])
      if(flash[:error] == "")
        flash.delete("error")
      end
      if(flash[:success] == "")
        flash.delete("success")
      end
      redirect_to controller: 'survey', action: 'edit_question', id: params[:id]
    elsif(params[:add_keyword])
      add_keyword_button(params)
      if(flash[:error] == "")
        flash.delete("error")
      end
      if(flash[:success] == "")
        flash.delete("success")
      end
      redirect_to controller: 'survey', action: 'edit_question', id: params[:id]
    elsif(params[:add_answer])
      add_answer_button(params)
      if(flash[:error] == "")
        flash.delete("error")
      end
      if(flash[:success] == "")
        flash.delete("success")
      end
      redirect_to controller: 'survey', action: 'edit_question', id: params[:id]
    elsif(params[:delete_answer])
      delete_answer_button(params[:delete_answer])
      if(flash[:error] == "")
        flash.delete("error")
      end
      if(flash[:success] == "")
        flash.delete("success")
      end
      redirect_to controller: 'survey', action: 'edit_question', id: params[:id]
    end
    

    
  end

  def add_answer_button(params)
    @answer = Answer.create(question_id: params[:id], answer_title: params[:new_answer_title], position: params[:new_answer_position])
    if(@answer.valid?)
      @answer.save
      flash[:success] = "Answer created successfully"
    else
      flash[:error] = "Answer not created: " + @answer.errors.full_messages.join(", ")
    end
  end

  def create_question
    @question = Question.create(question_title: params[:question_title])
    last_positio = 0
    if(Question.exists?)
      last_position = Question.all.order(position: :desc).first.position
    end
    if(params[:position] == "")
      # Add the question to the end of the survey
      @question.position = last_position + 1
    else
      # If the position submitted by the user is greater than the last position in the survey,
      # just make the question the last one in the survey.
      if(params[:position].to_i > last_position)
        @question.position = last_position + 1
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

  def add_keyword_button(params)
    answer = Answer.find(params[:add_keyword])
    answer.keywords.create(keyword: params[:new_keyword_title][params[:add_keyword]], weight: params[:new_keyword_weight][params[:add_keyword]])
    flash[:success] = "Keyword added successfully!"
  end

  def delete_question_button(params)
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
  end

  def delete_answer_button(params)
    answer = Answer.find(params[:id])
    question_id = answer.question_id
    answer.destroy
    if(answer.destroyed?)
      flash[:success] = "Answer deleted successfully"
    else
      flash[:error] = "Answer not deleted: " + answer.erros.full_messages.join(", ")
    end
  end

  def edit_answer
    @a = Answer.find(params[:id])
    @q = @a.question
  end

  def modify_answer
    a = Answer.find(params[:id])
    old_position = a.position
    new_position = params[:position].to_i
    last_positio = Answer.all.order(position: :desc).first.position
    answersBetween = {}
    if(new_position > last_position)
      new_position = last_position
    end

    if(new_position > 4)
      new_position = 4
    else
      if(old_position != nil && old_position != new_position)
        if(new_position < old_position)
          answersBetween = Answer.where("position >= ? AND position < ?", new_position, old_position).order(position: :desc)
          answersBetween.each do |answer|
            answer.position += 1
          end
        else
          answersBetween = Answer.where("position > ? AND position <= ?", old_position, new_position).order(position: :desc)
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
    a.update(:answer_title => params[:answer_title], :position => new_position)
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

  def delete_keyword_button(id)
    keyword = Keyword.find(id)
    keyword.destroy
    if(keyword.destroyed?)
      flash[:success] = "Keyword deleted successfully!"
    else
      flash[:error] = "Keyword not deleted: " + keyword.errors.full_messages.join(", ")
    end
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
        keyword_sum = a.keywords.count()
        a.keywords.each do |k|
          user_keywords[k.keyword] = k.weight.to_f / answer_weight_sum
          #user_keywords[k.keyword] /= keyword_sum
        end
        a.keywords.each do |k|
          user_keywords[k.keyword] = k.weight.to_f / answer_weight_sum
        end
      end
      rso_keywords = {}
      rsos = Rso.all
      rsos.each do |r|
        rso_keywords[r.id] = {}
        keyword_weight_sum = r.keywords.sum(:weight)
        keyword_sum = r.keywords.count()
        # normalize keyword weights so they are relative within the RSO
        r.keywords.each do |k|
          rso_keywords[r.id][k.keyword] = k.weight.to_f / keyword_weight_sum
          #rso_keywords[r.id][k.keyword] =
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
      puts rso_match_strengths.size
      i = 0
      if(rso_match_strengths[i][1] == 0.to_f)
        flash[:results] = "You didn't match with any clubs."
      else
        flash[:results] = "You matched with "
        max_matches = 5
        while i < max_matches && rso_match_strengths.size > i && rso_match_strengths[i][1] > 0
          if(rso_match_strengths.size > i + 1)
            if(rso_match_strengths[i + 1][1] == 0.0 || i == max_matches - 1)
              flash[:results] += " and "
            end
          end
          flash[:results] += Rso.find(rso_match_strengths[i][0]).name
          # Uncomment the code below to append the match strength to the results
          #flash[:results] += " (" + rso_match_strengths[i][1].to_s + ")"
          if(rso_match_strengths.size > i + 1)
            if(rso_match_strengths[i + 1][1] > 0 && i < max_matches - 1 )
              flash[:results] += ", "
            else
              flash[:results] += "."
            end
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
