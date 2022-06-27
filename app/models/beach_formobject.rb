class BeachFormobject
  include ActiveModel::Model
  include ActiveModel::Attributes

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
    validates :image
  end

  def initialize(attributes = nil,beach: Beach.new )
    @beach = beach
    # new_attributes = default_attributes.merge(attributes)
    # default_attributes
    attributes ||= default_attributes
    # binding.pry
    super(attributes)
  end

  # def to_model
  #   @beach
  # end

  def save

    raturn false if invalid?

    ActiveRecord::Base.transaction do
      @beachs = Beach.update(beach: beach, detail: detail, area_id: area_id, image: image, user_id: user_id)
      binding.pry
      activity_id.each do |activity|
        # BeachActivity.create(beach_id: @beachs.id, user_id: user_id, activity_id: activity)
        @beachs.beach_activitys.update(beach_id: @beachs.id, activity_id: activity, user_id: user_id)
      end
      
      facility_id.each do |facility|
        # BeachFacility.create(beach_id: @beachs.id, user_id: user_id, facility_id: facility)
        @beachs.beach_facilitys.create(beach_id: @beachs.id, facility_id: facility, user_id: user_id)
      end
    end

    true
  end

  def update(params)
    self.attributes = params
    save
    # @beach = Beach.update(beach: beach, detail: detail, area_id: area_id, image: image, user_id: user_id)
    # activity_id.each do |activity|
    #   BeachActivity.update(beach_id: @beach.id, user_id: user_id, activity_id: activity)
    # end
    # facility_id.each do |facility|
    #   BeachFacility.update(beach_id: @beach.id, user_id: user_id, facility_id: facility)
    # end
  end

  private

  def default_attributes
    {
      beach: @beach.beach,
      detail: @beach.detail,
      area_id: @beach.area_id,
      image: @beach.image,
      user_id: @beach.user_id,
      # beach_id: @beach.id,
      activity_id: @beach.beach_activitys.map(&:activity_id),
      facility_id: @beach.beach_facilitys.map(&:facility_id)
    }
    # binding.pry
  end
end