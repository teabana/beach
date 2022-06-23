class Facility < ActiveHash::Base
  self.data = [
    {id: 0, name: 'ライフセーバー'},
    {id: 1, name: '防護ネット'},
    {id: 2, name: '売店'},
    {id: 3, name: 'シャワー'},
    {id: 4, name: '駐車場'},
    {id: 5, name: 'トイレ'}
  ]

  include ActiveHash::Associations
  has_many :beach_facilitiys

end