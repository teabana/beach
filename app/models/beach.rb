class Beach < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :activity
  belongs_to :facility

  belongs_to :user
end
class Beach < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :activity
  belongs_to :facility

  belongs_to :user
  has_one_attached :image
