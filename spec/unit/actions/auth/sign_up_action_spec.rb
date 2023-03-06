# frozen_string_literal: true

require 'rails_helper'
require_relative '../../../../app/actions/auth/sign_up'
require_relative '../../../../app/repositories/user_repository'

describe Actions::Auth::SignUpAction do
  it 'should fail with generic message when receiving bad body' do
    fake_repo = double(UserRepository, create: nil)

    service = Actions::Auth::SignUpAction.new(fake_repo)

    sut = service.call(name: nil, password: nil, password_confirmation: nil, email: 'notemail')

    expect(sut[:status]).to be 400
    expect(sut[:error]).to be 'Invalid information to create a new user'
  end

  it 'should return user when receive correct body' do
    user = create(:user)
    fake_repo = double(UserRepository, create: user)

    service = Actions::Auth::SignUpAction.new(fake_repo)

    sut = service.call(name: 'test', password: 'password', password_confirmation: 'password', email: 'test@test.com')

    expect(sut[:status]).to be 200
    expect(sut[:error]).to be_nil
    expect(sut[:user]).to be user
  end
end
