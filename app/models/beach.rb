class Beach < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :activity
  belongs_to :facility

  belongs_to :user
end
class Beach < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :area
  has_many :beach_activitys, dependent: :destroy
  has_many :beach_facilitys, dependent: :destroy
  belongs_to_active_hash :activity, through: :beach_activitys
  belongs_to_active_hash :facility, through: :beach_facilitiys

  belongs_to :user
  has_one_attached :image, dependent: :destroy

end