# frozen_string_literal: true

require 'rails_helper'

describe AuthController, type: :request do
  it 'should authenticate with correct params and get user back' do
    # TODO: maybe we can use factory bot here ???
    User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')

    # TODO: Discover how to grab path from rails variable.
    post '/auth/sign_in', params: { email: 'test@test.com', password: 'test' }

    sut = JSON.parse(response.body)

    expect(response).to have_http_status(:success)
    expect(sut['token']).to be_a(String)
  end

  it 'should not authenticate with wrong params' do
    post auth_sign_in_path, params: { email: 'test@test.com', password: 'test' }

    sut = JSON.parse(response.body)

    expect(response).to have_http_status(:bad_request)
    expect(sut['error']).to_not be_empty
  end

  it 'should create new user with correct params' do
    post auth_sign_up_path,
         params: { name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test' }

    sut = JSON.parse(response.body)

    expect(response).to have_http_status(:success)
    expect(sut['name']).to eq 'test'
    expect(sut['email']).to eq 'test@test.com'
  end

  it 'should not create a new user with wrong params' do
    post auth_sign_up_path, params: { name: 'test' }

    sut = JSON.parse(response.body)

    expect(response).to have_http_status(:bad_request)
    expect(sut['error']).to_not be_empty
  end
end
