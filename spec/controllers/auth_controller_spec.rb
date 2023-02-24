require 'rails_helper'

describe AuthController, type: :request do
  it 'should authenticate with correct params and get user back' do
    # TODO: maybe we can use factory bot here ???
    User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')

    # TODO: Discover how to grab path from rails variable.
    post '/auth/sign_in', params: { email: 'test@test.com', password: 'test' }
    assert_response :success

    sut = ActiveSupport::JSON.decode @response.body

    assert sut['name'] == 'test'
    assert sut['email'] == 'test@test.com'
  end

  it 'should not authenticate with wrong params' do
    post auth_sign_in_path, params: { email: 'test@test.com', password: 'test' }
    assert_response :bad_request

    sut = ActiveSupport::JSON.decode @response.body

    assert_not sut['error'].empty?
  end

  it 'should create new user with correct params' do
    post auth_sign_up_path,
         params: { name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test' }
    assert_response :success

    sut = ActiveSupport::JSON.decode @response.body

    assert sut['name'] == 'test'
    assert sut['email'] == 'test@test.com'
  end

  it 'should not create a new user with wrong params' do
    post auth_sign_up_path, params: { name: 'test' }
    assert_response :bad_request

    sut = ActiveSupport::JSON.decode @response.body

    assert_not sut['error'].empty?
  end
end
