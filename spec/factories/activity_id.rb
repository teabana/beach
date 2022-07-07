FactoryBot.define do
  factory :beach_activity do
    activity_id           { Faker::Number.within(range: 1..4) }
  end
  # binding.pry
end