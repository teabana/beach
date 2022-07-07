class BeachFormobject
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :user_id, :name, :detail, :area_id, :image, 
                :beach_id, :activity_id, :facility_id, :activitys, :facilitys

  with_options presence: true do
    validates :name
    validates :detail
    validates :area_id
    validates :activity_id
    validates :facility_id
    validates :image
  end


  def initialize(attributes = nil, beach: Beach.new )
    @beach = beach
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    raturn false if invalid?

    ActiveRecord::Base.transaction do
      @newbeach = Beach.create(name: name, detail: detail, area_id: area_id, image: image, user_id: user_id)

      activity_id.each do |activity|
        BeachActivity.create(beach_id: @newbeach.id, activity_id: activity, user_id: user_id)
      end
  
      facility_id.each do |facility|
        BeachFacility.create(beach_id: @newbeach.id, facility_id: facility, user_id: user_id)
      end
      
    end

    true
  end

  def update
    raturn false if invalid?
    ActiveRecord::Base.transaction do
      BeachActivity.where(beach_id: @beach.id).delete_all
      activity_id.each do |activity|
        activityIDs = BeachActivity.where(beach_id: @beach.id, user_id: user_id, activity_id: activity).first_or_initialize if activity.present?
        activityIDs.save if activity.present?
      end

      BeachFacility.where(beach_id: @beach.id).delete_all
      facility_id.each do |facility|
        facilityIDs = BeachFacility.where(beach_id: @beach.id, user_id: user_id, facility_id: facility).first_or_initialize if facility.present?
        facilityIDs.save if facility.present?
      end

      @beach.update!(name: name, detail: detail, area_id: area_id, image: image, user_id: user_id)
    end

    true
  end

  private

  def default_attributes
    {
      name: @beach.name,
      detail: @beach.detail,
      area_id: @beach.area_id,
      image: @beach.image,
      user_id: @beach.user_id,
      activity_id: @beach.beach_activitys.pluck(:activity_id),
      facility_id: @beach.beach_facilitys.pluck(:facility_id)
    }
  end
end
