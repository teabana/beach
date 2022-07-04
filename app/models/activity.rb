class Activity < ActiveHash::Base
  self.data = [
    {id: 0, name: '海水浴'},
    {id: 1, name: 'シュノーケリング'},
    {id: 2, name: 'SUP'},
    {id: 3, name: 'サーフィン'},
    {id: 4, name: 'BBQ/焚き火'}
  ]
  
  include ActiveHash::Associations
  has_many :beach_activitys

end