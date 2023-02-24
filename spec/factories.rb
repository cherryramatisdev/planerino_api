# frozen_string_literal: true

password = Faker::Alphanumeric.alpha(number: 10)

FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { password }
    password_confirmation { password }
  end
end
