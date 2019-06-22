require 'rails_helper'

RSpec.describe Chore, type: :model do
  let(:test_chore) {Chore.create(name: 'Test Chore', house: FactoryBot.create(:house))}
  let(:failed_chore) {Chore.create(status: 'not included', cost: 'NaN')}
  let(:errors) {failed_chore.errors.full_messages}

  scenario 'is created successfully with certain default values' do
    test_chore
    expect(Chore.first.name).to eq test_chore.name
    expect(Chore.first.house).to eq House.first
    expect(Chore.first.status).to eq 'unclaimed'
    expect(Chore.first.cost).to eq 0
    expect(Chore.first.due).to be_within(1.second).of Time.now.utc
    expect(Chore.first.user).to be nil
  end

  scenario 'failed to create' do
    expect(errors.size).to eq 3
    expect(errors).to include 'Name can\'t be blank'
    expect(errors).to include 'House must exist'
    expect(errors).to include 'Status is not included in the list'
    expect(failed_chore.cost).to_not eq 'NaN'
    expect(Chore.first).to be nil
  end

  scenario 'has associations' do
    #Default RSpec syntax
    assc1 = described_class.reflect_on_association(:house)
    expect(assc1.macro).to eq :belongs_to
    assc2 = described_class.reflect_on_association(:user)
    expect(assc2.macro).to eq :belongs_to
    expect(assc2.options[:optional]).to eq true

    #Shoulda gem syntax variations
    should belong_to(:house)
    is_expected.to belong_to(:house)
    should belong_to(:user).optional
    is_expected.to belong_to(:user).optional
  end
end
