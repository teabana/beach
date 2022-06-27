class BeachActivity < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :beach
  belongs_to :user
  
  belongs_to_active_hash :activity
end
