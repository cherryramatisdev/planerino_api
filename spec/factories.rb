# frozen_string_literal: true

FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password_digest { Faker::Alphanumeric.alpha(number: 10) }
  end
end
