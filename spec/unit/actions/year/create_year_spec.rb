# frozen_string_literal: true

require 'rails_helper'

require_relative '../../../../app/actions/year/create_year'

describe Actions::Year::CreateYearAction do
  it 'should return 500 if provided user is nil' do
    fake_repo = double(YearRepository)
    service = Actions::Year::CreateYearAction.new(fake_repo)

    sut = service.call(name: 'test', user: nil)

    expect(sut[:status]).to eq(500)
    expect(sut[:error]).to eq('Internal Server Error')
  end

  it 'should return 400 if model validation fails' do
    fake_repo = double(YearRepository, create: nil)
    service = Actions::Year::CreateYearAction.new(fake_repo)

    sut = service.call(name: 'test', user: create(:user))

    expect(sut[:status]).to eq(400)
    expect(sut[:error]).to eq('Provide correct body information with name')
  end

  it 'should return 200 if model validation passes' do
    year_mock = create(:year)
    fake_repo = double(YearRepository, create: year_mock)

    service = Actions::Year::CreateYearAction.new(fake_repo)

    sut = service.call(name: 'test', user: create(:user))

    expect(sut[:status]).to eq(204)
    expect(sut[:error]).to be_nil
    expect(sut[:year]).to eq(year_mock)
  end
end
