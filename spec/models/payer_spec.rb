require 'rails_helper'

RSpec.describe Payer, type: :model do
  it 'should fail to create a payer with an invalid body' do
    payer = Payer.create
    expect(payer.valid?).to be_falsy
    expect(payer.errors.full_messages).to eq ["Name can't be blank"]
  end
end
