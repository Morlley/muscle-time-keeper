FactoryBot.define do
  factory :next_routine do
    menu         {Faker::Lorem.sentence}
    set_count_id {Faker::Number.between(from: 2, to: 11)}
    rest_id      {Faker::Number.between(from: 2, to: 9)}
    association :routine
  end
end
