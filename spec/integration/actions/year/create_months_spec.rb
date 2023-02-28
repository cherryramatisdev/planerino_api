# frozen_string_literal: true

require 'rails_helper'

require_relative '../../../../app/actions/year/create_months'

describe Actions::Year::CreateMonthsAction do
  it 'should return 500 if no year is found' do
    fake_month_repo = double(MonthRepository)
    fake_year_repo = double(YearRepository, find_by_id: nil)

    service = Actions::Year::CreateMonthsAction.new(fake_month_repo, fake_year_repo)

    sut = service.call(year_id: 1)

    expect(sut[:status]).to eq(500)
    expect(sut[:error]).to eq('Internal Server Error')
  end

  it 'should return 500 if the bulk insert of month fails' do
    fake_month_repo = double(MonthRepository, create_all_months_in_a_year: nil)
    fake_year_repo = double(YearRepository, find_by_id: create(:year))

    service = Actions::Year::CreateMonthsAction.new(fake_month_repo, fake_year_repo)

    sut = service.call(year_id: 1)

    expect(sut[:status]).to eq(500)
    expect(sut[:error]).to eq('Internal Server Error')
  end

  it 'should return 200 if the bulk insert of month succeeds' do
    fake_month_repo = double(MonthRepository, create_all_months_in_a_year: create(:month))
    fake_year_repo = double(YearRepository, find_by_id: create(:year))

    service = Actions::Year::CreateMonthsAction.new(fake_month_repo, fake_year_repo)

    sut = service.call(year_id: 1)

    expect(sut[:status]).to eq(204)
    expect(sut[:error]).to be_nil
  end
end
