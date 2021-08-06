FactoryBot.define do
  factory :routine do
    name            {Faker::Lorem.sentence}
    menu            {Faker::Lorem.sentence}
    workout_time_id {Faker::Number.between(from: 2, to: 11)}
    set_count_id    {Faker::Number.between(from: 2, to: 11)}
    rest_id         {Faker::Number.between(from: 2, to: 9)}
    association :user
  end
end
