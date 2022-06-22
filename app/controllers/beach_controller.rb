class BeachController < ApplicationController

  def index
  end

  def search_index
  end

  def search
  end

  def new
    @beach = Beach.new
  end

  def create 
    @beach = Beach.new(beach_params)
    if @beach.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def beach_params
    params.require(:beach).permit(:beach, :detail, :area_id, { :activity_id => [] }, { :facility_id => []}, :image).merge(user_id: current_user.id)
  end
  
end
