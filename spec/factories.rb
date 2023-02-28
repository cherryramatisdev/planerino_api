# frozen_string_literal: true

password = Faker::Internet.password

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end

  factory :year do
    name { Faker::Date.between(from: 10.years.ago, to: Date.today).year.to_s }
    user
  end

  factory :month do
    name { Faker::Name.name }
    year
  end
end
