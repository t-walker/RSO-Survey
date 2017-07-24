class RsoController < ApplicationController
  def index
  end

  def manage
    @rsos = Rso.all
  end

  def create_rso
    rso = Rso.create({name: params[:name], nickname: params[:nickname]})
    flash[:success] = "RSO added successfully!"
    redirect_to action: "manage"
  end

  def delete_rso
    Rso.find(params[:rso_id]).destroy
    flash[:success] = "RSO deleted successfully"
    redirect_to action: "manage"
  end

end
