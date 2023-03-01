# frozen_string_literal: true

require 'rails_helper'

describe PayerController, type: :request do
  describe 'POST /payer' do
    it 'should return error if body is invalid' do
      post '/payer'

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:bad_request)
      expect(body['error']).to eq('Provide correct body information')
    end

    it 'should return payer if body is valid' do
      post '/payer', params: { name: 'John Doe' }

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:created)
      expect(body['name']).to eq('John Doe')
    end
  end
end
