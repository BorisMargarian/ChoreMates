require 'rails_helper'

RSpec.describe House, type: :model do
  let(:test_house) {House.create(name: 'Test House', password: 'test-house')}
  let(:failed_house) {House.create()}
  let(:errors) {failed_house.errors.full_messages}
  let(:user_list) {FactoryBot.create_list(:user, 3)}
  let(:chore_list) {FactoryBot.create_list(:chore, 3)}

  scenario 'test_house is created successfully' do
    expect(test_house.name).to eq 'Test House'
    expect(test_house.password).to eq 'test-house'
  end

  scenario 'a blank house fails to create' do
    expect(errors.length).to eq 2
    expect(errors).to include 'Name can\'t be blank'
    expect(errors).to include 'Password can\'t be blank'
  end

  scenario 'two houses cannot have the same name' do
    failed_house.update_attributes(test_house.attributes)
    expect(errors.size).to eq 1
    expect(errors).to include('Name has already been taken')
  end

  scenario 'newly created house has no users or chores' do
    expect(test_house.users.empty?).to be true
    expect(test_house.chores.empty?).to be true
  end

  scenario 'a house can have many users' do
    test_house.users << user_list
    expect(test_house.users.size).to eq 3

    #Found a better way to test associations online
    assc = described_class.reflect_on_association(:users)
    expect(assc.macro).to eq :has_many

    #Got the shoulda gem to work!
    should have_many(:users)
  end

  scenario 'a house can have many chores' do
    test_house.chores << chore_list
    expect(test_house.chores.size).to eq 3

    #Found a better way to test associations online
    assc = described_class.reflect_on_association(:chores)
    expect(assc.macro).to eq :has_many

    #Got the shoulda gem to work!
    should have_many(:chores)
  end
end
