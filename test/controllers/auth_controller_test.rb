require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  test 'should authenticate with correct params and get user back' do
    User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
    post auth_sign_in_url, params: { email: 'test@test.com', password: 'test' }
    assert_response :success

    sut = ActiveSupport::JSON.decode @response.body

    assert sut['name'] == 'test'
    assert sut['email'] == 'test@test.com'
  end

  test 'should not authenticate with wrong params' do
    post auth_sign_in_url, params: { email: 'test@test.com', password: 'test' }
    assert_response :bad_request

    sut = ActiveSupport::JSON.decode @response.body

    assert_not sut['error'].empty?
  end

  test 'should create new user with correct params' do
    post auth_sign_up_url, params: { name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test' }
    assert_response :success

    sut = ActiveSupport::JSON.decode @response.body

    assert sut['name'] == 'test'
    assert sut['email'] == 'test@test.com'
  end

  test 'should not create a new user with wrong params' do
    post auth_sign_up_url, params: { name: 'test' }
    assert_response :bad_request

    sut = ActiveSupport::JSON.decode @response.body

    assert_not sut['error'].empty?
  end
end
