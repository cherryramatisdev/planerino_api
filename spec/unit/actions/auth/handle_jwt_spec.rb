# frozen_string_literal: true

require 'jwt'
require 'rails_helper'
require_relative '../../../../app/actions/auth/handle_jwt'

describe Actions::Auth::HandleJwtAction do
  it 'should encode user data' do
    expected_token = 'encoded_jwt'
    allow(JWT).to receive(:encode).and_return(expected_token)
    service = Actions::Auth::HandleJwtAction.new

    sut = service.encode_user_email(user_email: 'test@test.com')

    expect(sut).to eq(expected_token)
  end

  it 'should decode user data' do
    user = create(:user)
    allow(JWT).to receive(:decode).and_return([{ 'email' => user.email }])
    fake_repo = double(UserRepository, find_by_email: user)
    service = Actions::Auth::HandleJwtAction.new(fake_repo)

    sut = service.decode_into_user(token: 'encoded_jwt')

    expect(sut).to eq(user)
  end
end
