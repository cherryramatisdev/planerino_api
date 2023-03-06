# frozen_string_literal: true

require 'rails_helper'

require_relative '../../../../app/actions/payer/create_payer'

describe Actions::Payer::CreatePayer do
  it 'should return 400 if name is not provided' do
    fake_repo = double(PayerRepository, create_or_find: nil)
    service = Actions::Payer::CreatePayer.new(fake_repo)

    sut = service.call(name: nil)

    expect(sut[:status]).to eq(400)
    expect(sut[:error]).to eq('Provide correct body information')
  end

  it 'should return 200 if name is provided' do
    payer = create(:payer)
    allow(payer).to receive(:valid?).and_return(true)
    fake_repo = double(PayerRepository, create_or_find: payer)
    service = Actions::Payer::CreatePayer.new(fake_repo)

    sut = service.call(name: payer.name)

    expect(sut[:status]).to eq(201)
    expect(sut[:error]).to be_nil
    expect(sut[:payer]).to be(payer)
  end
end
