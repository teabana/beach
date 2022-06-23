class BeachFormobject
  include ActiveModel::Model 
  attr_accessor :user_id, :beach, :detail, :area_id, :image, 
                :beach_id, :activity_id, :facility_id  

  with_options presence: true do
    validates :user_id
    validates :beach
    validates :detail
    validates :area_id
    # validates :beach_id
    validates :activity_id
    validates :facility_id
  end

  def save
    @beach = Beach.create(beach: beach, detail: detail, area_id: area_id, image: image, user_id: user_id)
    activity_id.each do |activity|
      BeachActivity.create(beach_id: @beach.id, user_id: user_id, activity_id: activity)
    end
    facility_id.each do |facility|
      BeachFacility.create(beach_id: @beach.id, user_id: user_id, facility_id: facility)
    end
    # BeachActivity.create(beach_id: @beach.id, user_id: user_id, activity_id: activity_id)
    # BeachFacility.create(beach_id: @beach.id, user_id: user_id, facility_id: facility_id)
  end
    
end