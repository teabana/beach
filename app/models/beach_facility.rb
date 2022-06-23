class BeachFacility < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :beach
  belongs_to :user
  
  belongs_to :facility
end
