class RsoController < ApplicationController
  def index
  end

  def manage
    @rsos = Rso.order(:name)
    @officers = Officer.order(:last)
  end

  def edit
    @rso = Rso.find(params[:id])
    @officers = Officer.order(:last)
  end

  def create_rso
    rso = Rso.create({name: params[:name], nickname: params[:nickname]})
    if(rso.valid?)
      flash[:success] = "RSO created successfully"
    else
      flash[:error] = "RSO not created: " + rso.errors.full_messages.join(", ")
    end
    redirect_to action: "manage"
  end

  def delete_rso
    rso = Rso.find(params[:rso_id])
    rso.destroy
    if(rso.destroyed?)
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
    redirect_to controller: 'rso', action: 'edit', id: params[:rso_id]
  end

  def delete_keyword
    keyword = Keyword.find(params[:keyword_id])
    keyword.destroy
    if(keyword.destroyed?)
      flash[:success] = "Keyword deleted successfully"
    else
      flash[:error] = "Keyword not deleted"
    end

    redirect_to controller: 'rso', action: 'edit', id: params[:rso_id]
  end

  def add_officer
    newOfficer = Officer.find(params[:officer_id])
    rso = Rso.find(params[:rso_id])
    begin
      rso.officers << newOfficer
      flash[:success] = "Officer added to RSO successfully"
    rescue ActiveRecord::RecordInvalid => invalid
      flash[:error] = "Officer not added to RSO: " + invalid.record.errors.full_messages.join(", ")
    end

    redirect_to controller: 'rso', action: 'edit', id: params[:rso_id]
  end

  def delete_officer
    Rso.find(params[:rso_id]).officers.delete(Officer.find(params[:officer_id]))
    if(!(Rso.find(params[:rso_id]).officers.where(:id => params[:officer_id]).any?))
      flash[:success] = "Officer removed from RSO successfully"
    else
      flash[:error] = "Officer not removed from RSO"
    end

    redirect_to controller: 'rso', action: 'edit', id: params[:rso_id]
  end


end
