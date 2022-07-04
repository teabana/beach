class BeachsController < ApplicationController
  before_action :find_beach, only: [:show, :destroy, :edit, :update]
  before_action :user_signed?, only: [:index, :search_index, :new, :create, :show, :edit, :update]

  def index
  end

  def search_index
    # @beach = Beach.all
    @q = Beach.ransack(params[:q])
    @beach = @q.result.includes(:beach_activitys, :beach_facilitys)
    # binding.pry
  end

  def search
    return nil if params[:keyword] == ""
    beach = Beach.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: beach }
    # @q = Beach.ransack(params[:q])
    # @beachs = @q.result
  end

  def new
    @beach_formobject = BeachFormobject.new
  end

  def create 
    @beach_formobject = BeachFormobject.new(beach_formobject_params)
    if @beach_formobject.valid?
      @beach_formobject.save
      redirect_to beach_search_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @beach_formobject = BeachFormobject.new(beach: @beach)
  end

  def update
    @beach_formobject = BeachFormobject.new(beach_formobject_params, beach: @beach)
    @beach_formobject.image ||= @beach.image.blob

    if @beach_formobject.valid?
      @beach_formobject.update
      redirect_to beach_search_path
    else
      render :edit
    end
  end

  def destroy
    @beach.destroy
    redirect_to beach_search_path
  end

  private

  def beach_formobject_params
    params.require(:beach_formobject).permit(
      :name, :detail, :area_id, :image, activity_id: [], facility_id: []).merge(
        user_id: current_user.id
      )
  end

  def user_signed?
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def find_beach
    @beach = Beach.find(params[:id])
  end

end
