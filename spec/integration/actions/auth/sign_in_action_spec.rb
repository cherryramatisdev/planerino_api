# frozen_string_literal: true

require 'rails_helper'
require_relative '../../../../app/actions/auth/sign_in'
require_relative '../../../../app/repositories/user_repository'

describe Actions::Auth::SignInAction do
  it 'should return an object with error message when user is nil' do
    fake_repo = double(UserRepository, find_by_email: nil)
    service = Actions::Auth::SignInAction.new(fake_repo)

    sut = service.call(email: 'test@test.com', password: 'test')

    expect(sut[:status]).to be 400
    expect(sut[:error]).to be 'Invalid email or password'
  end

  it 'should return user object when credentials are valid' do
    user = create(:user)
    fake_repo = double(UserRepository, find_by_email: user)
    service = Actions::Auth::SignInAction.new(fake_repo)

    allow(user).to receive(:authenticate).with('test').and_return(true)
    sut = service.call(email: 'test@test.com', password: 'test')

    expect(sut[:status]).to be 200
    expect(sut[:error]).to be_nil
    expect(sut[:user]).to be user
  end
end
