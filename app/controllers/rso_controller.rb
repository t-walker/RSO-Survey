class RsoController < ApplicationController
  def index
  end

  def manage
    @rsos = Rso.order(:name)
    @officers = Officer.order(:last)
  end

  def edit
    @rso = Rso.includes(:keywords).find(params[:id])
    @keywords = Keyword.uniq.pluck(:keyword).sort!
  end

  def bulk_upload
  end

  def modify_rso
    rso = Rso.find(params[:rso_id])
    flash[:success] = ""
    flash[:error] = ""
    rso.assign_attributes(name: params[:name], nickname: params[:nickname], website: params[:website], description: params[:description])
    if defined? params["keyword_weights"].keys
      params["keyword_weights"].keys.each do |k_id|
        keyword = Keyword.find(k_id)
        keyword.assign_attributes(weight: params[:keyword_weights][k_id])
        if(keyword.valid?)
          keyword.save
          flash[:success] += "Keyword updated successfully."
        else
          flash[:error] += "Keyword " + keyword.keyword + " not updated: " + keyword.errors.full_messages.join(", ")
        end
      end
    end
    if(rso.valid?)
      rso.save!
      flash[:success] = "RSO updated successfully."
    else
      flash[:error] += "RSO not updated: " + rso.errors.full_messages.join(", ")
    end
    if(flash[:error] == "")
      flash.delete("error")
    end
    if(flash[:success] == "")
      flash.delete("success")
    end
    redirect_to controller: 'rso', action: 'edit', id: params[:rso_id]
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

  def edit_keyword
    keyword = Keyword.find(params[:keyword_id])
    keyword.update(keyword: params[:keyword], weight: params[:weight])
    if(keyword.valid?)
      keyword.save!
      flash[:success] = "Keyword updated successfully"
    else
      flash[:error] = "Keyword not updated: " + keyword.errors.full_messages.join(", ")
    end
  end

  def delete_keyword
    Rso.find(params[:rso_id]).keywords.delete(params[:keyword_id])
    if(!(Rso.find(params[:rso_id]).keywords.where(id: params[:keyword_id]).exists?))
      flash[:success] = "Keyword deleted successfully"
    else
      flash[:error] = "Keyword not deleted"
    end

    redirect_to controller: 'rso', action: 'edit', id: params[:rso_id]
  end
end
