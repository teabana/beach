FactoryBot.define do
  factory :beach_formobject do
    name              { Faker::Name.name }
    detail            { Faker::Hipster.sentence }  
    area_id           { Faker::Number.within(range: 1..3) }
    association       :user

    after(:build) do |beach|
      beach.image.attach(io: File.open('public/images/sample.jpg'), filename: 'test_image.jpeg')
    end
  end
end