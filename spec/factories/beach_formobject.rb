FactoryBot.define do
  factory :beach_formobject do
    name              { Faker::Name.name }
    detail            { Faker::Hipster.sentence }  
    area_id           { Faker::Number.within(range: 1..3) }
    user_id           { Faker::Number.within(range: 10..13) }
  end
end