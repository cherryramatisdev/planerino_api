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

      post '/debit', params: { title: 'title', price: 10.0, paid: false, payer_id: payer.id, month_id: month.id }

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:created)
      expect(body['title']).to eq('title')
      expect(body['price']).to eq(10.0)
      expect(body['paid']).to be_falsy
      expect(body['payer_id']).to eq(payer.id)
      expect(body['month_id']).to eq(month.id)
    end
  end
end
