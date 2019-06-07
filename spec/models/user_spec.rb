require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:test_user) {User.create(username: 'Test User', email: 'test.user@gmail.com', password: 'test-user')}
  let!(:failed_user) {User.create()}
  let(:errors) {failed_user.errors.full_messages}

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
  end

  scenario 'two users cannot have the same: username or email' do
    failed_user.update_attributes(username: 'Test User', email: 'test.user@gmail.com')
    expect(errors.length).to be 3
    expect(errors).to include('Username has already been taken')
    expect(errors).to include('Email has already been taken')
  end
end
