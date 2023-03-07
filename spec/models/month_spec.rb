require 'rails_helper'

RSpec.describe Month, type: :model do
  it 'should fail to create a month with an invalid body' do
    month = Month.create
    expect(month.valid?).to be_falsy
    expect(month.errors.full_messages).to eq ['Year must exist']
  end
end
