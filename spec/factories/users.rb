FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6) + "1a"
    password {password}
    password_confirmation {password}
    birthday              {Faker::Date.in_date_period}
  end
end