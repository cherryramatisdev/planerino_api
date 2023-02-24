require 'rails_helper'

describe Year, type: :model do
  it 'should fail when not providing correct body' do
    year = Year.create

    expect(year.errors.full_messages).to eq ['User must exist', "Name can't be blank"]
    expect(year.valid?).to be_falsy
  end

  it 'should create year when providing correct body' do
    user = create(:user)
    year = Year.create(name: '2023', user:)

    expect(year.errors.full_messages).to eq []
    expect(year.valid?).to be_truthy
    expect(year.name).to eq '2023'
  end
end
