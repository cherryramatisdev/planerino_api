# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  it 'should fail when not providing correct body' do
    user = User.create
    expect(user.valid?).to be_falsy
    expect(user.errors.full_messages).to eq ["Password can't be blank", "Name can't be blank", "Email can't be blank",
                                             "Password can't be blank", "Password confirmation can't be blank"]
  end
end
