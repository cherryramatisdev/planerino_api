# frozen_string_literal: true

password = Faker::Alphanumeric.alpha(number: 10)

FactoryBot.define do
  factory :month do
    name { "MyString" }
    year { nil }
    user { nil }
  end

  factory :year do
    name { "MyString" }
    user { nil }
  end

  factory(:user) do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { password }
    password_confirmation { password }
  end
end
