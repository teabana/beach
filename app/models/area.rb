class Area < ActiveHash::Base
  self.data = [
    { id: 0, name: '北部'},
    { id: 1, name: '中部'},
    { id: 2, name: '南部'}
  ]

  include ActiveHash::Associations
  has_many :beachs

end