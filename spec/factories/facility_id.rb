FactoryBot.define do
  factory :beach_facility do
    facility_id           { Faker::Number.within(range: 1..5) }
  end
end