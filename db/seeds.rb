# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
House.all.destroy_all

if Rails.env.development? || Rails.env.production?
  HouseSeeder.seed!
end

if Rails.env.development? || Rails.env.production?
  UserSeeder.seed!
end

if Rails.env.development? || Rails.env.production?
  ChoreSeeder.seed!
end
