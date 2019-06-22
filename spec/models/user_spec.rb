require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_user) {User.create(username: 'Test User', email: 'test.user@gmail.com', password: 'test-user')}
  let(:failed_user) {User.create()}
  let(:errors) {failed_user.errors.full_messages}
  let(:test_house) {House.create(name: 'Test House', password: 'test-house')}
  let(:test_house1) {House.create(name: 'Test House1', password: 'test-house1')}
  let(:test_chore) {Chore.create(name: 'Test Chore', house: test_house)}
  let(:test_chore1) {Chore.create(name: 'Test Chore1', house: test_house)}

  scenario 'test_user is created successfully' do
    expect(test_user.username).to eq('Test User')
    expect(test_user.email).to eq('test.user@gmail.com')
    expect(test_user.password).to eq('test-user')
  end

  scenario 'blank user fails to be created' do
    expect(errors.length).to be 3
    expect(errors).to include('Username can\'t be blank')
    expect(errors).to include('Email can\'t be blank')
    expect(errors).to include('Password can\'t be blank')
    expect(User.first).to be nil
  end

  scenario 'two users cannot have the same: username or email' do
    failed_user.update_attributes(test_user.attributes)
    expect(errors.length).to be 3
    expect(errors).to include('Username has already been taken')
    expect(errors).to include('Email has already been taken')
  end

  scenario 'newly registered user does not belong to a house' do
    expect(test_user.house.nil?).to be true
  end

  scenario 'a user can (optionally) belong to only a single house' do
    test_user.house = test_house
    expect(test_user.house).to be test_house
    test_house1.users << test_user
    expect(test_user.house).to be test_house1

    #Found a better way to test associations online
    assc = described_class.reflect_on_association(:house)
    expect(assc.macro).to eq :belongs_to

    #Got the shoulda gem to work!
    should belong_to(:house).optional
  end

  scenario 'newly registered user should not have any chores' do
    expect(test_user.chores.empty?).to be true
  end

  scenario 'a user can have many chores' do
    test_user.chores << test_chore << test_chore1
    expect(test_user.chores.size).to eq 2

    #Found a better way to test associations online
    assc = described_class.reflect_on_association(:chores)
    expect(assc.macro).to eq :has_many

    #Got the shoulda gem to work!
    should have_many(:chores)
    #The below syntax seems to be preferred over the ones above
    is_expected.to have_many(:chores)
  end
end
