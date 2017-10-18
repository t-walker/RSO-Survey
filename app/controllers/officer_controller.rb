class OfficerController < ApplicationController
  def index
  end

  def manage
    @officers = Officer.order(:last)
  end

  def create_officer
    officer = Officer.create(:first => params[:first], :last => params[:last], :email => params[:email], :phone => params[:phone ])
    #rso = Rso.create({name: params[:name], nickname: params[:nickname]})
    if(officer.valid?)
      flash[:success] = "Officer created successfully"
    else
      flash[:error] = "Officer not created: " + officer.errors.full_messages.join(", ")
    end
    redirect_to action: "manage"
  end

  def delete_officer
    Officer.find(params[:officer_id]).destroy
    if(!(Officer.where(:id => params[:officer_id]).exists?))
      flash[:success] = "Officer deleted successfully"
    else
      flash[:error] = "Officer not deleted"
    end
    redirect_to action: "manage"
  end





end
