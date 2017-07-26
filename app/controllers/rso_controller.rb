class RsoController < ApplicationController
  def index
  end

  def manage
    @rsos = Rso.order(:name)
  end

  def create_rsos
    rso = Rso.create({name: params[:name], nickname: params[:nickname]})
    flash[:success] = "RSO added successfully!"
    redirect_to action: "manage"
  end

  def delete_rso
    if(Rso.find(params[:rso_id]).destroyed?)
      flash[:success] = "RSO deleted successfully"
    else
      flash[:error] = "RSO not deleted"
    end
    redirect_to action: "manage"
  end

  def add_keyword
    new_keyword = Rso.find(params[:rso_id]).keywords.create({keyword: params[:keyword], weight: params[:weight]})
    if(new_keyword.valid?)
      flash[:success] = "Keyword added successfully to RSO"
    else
      flash[:error] = "Keyword not added to RSO: " + new_keyword.errors.full_messages.join(", ")
    end
    redirect_to action: "manage"
  end

  def delete_keyword
    Keyword.find(params[:keyword_id]).destroy
    flash[:success] = "Keyword deleted successfully"

    redirect_to action: "manage"
  end


end
