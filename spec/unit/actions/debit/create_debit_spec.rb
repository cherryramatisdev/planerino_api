# frozen_string_literal: true

require 'rails_helper'

require_relative '../../../../app/actions/debit/create_debit'

describe Actions::Debit::CreateDebit do
  it 'should return 400 if body is incorrect' do
    fake_repo = double(DebitRepository, create: nil)
    service = Actions::Debit::CreateDebit.new(fake_repo)

    sut = service.call(title: 'title', price: 0.0, paid: false, payer: create(:payer), month: create(:month))

    expect(sut[:status]).to eq(400)
    expect(sut[:error]).to eq('Provide correct body information')
  end

  it 'should return 200 with debit instance if body is correct' do
    fake_repo = double(DebitRepository, create: create(:debit))
    service = Actions::Debit::CreateDebit.new(fake_repo)

    sut = service.call(title: 'title', price: 0.0, paid: false, payer: create(:payer), month: create(:month))

    expect(sut[:status]).to eq(201)
    expect(sut[:error]).to be_nil
    expect(sut[:debit]).to be_a(Debit)
  end
end
