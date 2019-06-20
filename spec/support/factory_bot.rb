require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:username) {|n| "user#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

FactoryBot.define do
  factory :house do
    sequence(:name) {|n| "Test House#{n}"}
    password { 'test-house' }
  end
end

FactoryBot.define do
  factory :chore do
    sequence(:name) {|n| "Test Chore#{n}"}
    house { House.first }
  end
end
