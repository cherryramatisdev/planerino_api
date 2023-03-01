# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Debit, type: :model do
  it 'should fail to create a debit with an invalid body' do
    debit = Debit.create
    expect(debit.valid?).to be_falsy
    expect(debit.errors.full_messages).to eq ['Payer must exist', 'Month must exist', "Title can't be blank",
                                              "Price can't be blank", 'Price is not a number']
  end
end
