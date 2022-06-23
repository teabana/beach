class BeachsController < ApplicationController
  before_action :user_signed?, only: [:index, :search_index, :new, :create]

  def index
  end

  def search_index

  end

  def search
  end

  def new
    @beach_formobject = BeachFormobject.new
  end

  def create 
    @beach_formobject = BeachFormobject.new(beach_formobject_params)
    # binding.pry
    if @beach_formobject.valid?
      @beach_formobject.save
      redirect_to root_path
    else
      binding.pry
      render :new
    end
  end


  private

  def beach_formobject_params
    params.require(:beach_formobject).permit(
      :beach, :detail, :area_id, :image, {activity_id: []}, {facility_id: []}).merge(
        user_id: current_user.id
      )
  end

  def user_signed?

    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

end
