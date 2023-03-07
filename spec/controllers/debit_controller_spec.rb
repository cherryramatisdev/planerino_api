# frozen_string_literal: true

require 'rails_helper'

describe DebitController, type: :request do
  describe 'POST /debit' do
    it 'should return error if body is invalid' do
      post '/debit'

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:bad_request)
      expect(body['error']).to eq('Provide correct body information')
    end

    it 'should return debit if body is valid' do
      password = Faker::Internet.password
      user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password:,
                         password_confirmation: password)
      payer = Payer.create(name: Faker::Name.name)
      year = Year.create(name: '2023', user:)
      month = Month.create(name: Faker::Date.between(from: '2022-01-01', to: '2023-01-01').strftime('%B'), year:)

      post '/debit', params: { title: 'title', price: 0.0, paid: false, payer:, month: }

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:created)
      expect(body['name']).to eq('John Doe')
    end
  end
end
