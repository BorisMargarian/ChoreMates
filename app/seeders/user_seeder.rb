class UserSeeder
  STARK = House.find_by(name: "House Stark")
  USER_DATA = [
    {username: "BorisMargarian", email: "margarian.boris@gmail.com", password: "123456"},
    {username: "JohnSnow", email: "john.snow@gmail.com", password: "123456", house: STARK},
    {username: "SansaStark", email: "sansa.stark@gmail.com", password: "123456", house: STARK},
    {username: "AryaStark", email: "arya.stark@gmail.com", password: "123456", house: STARK},
    {username: "BranStark", email: "bran.stark@gmail.com", password: "123456", house: STARK}
  ]

  def self.seed!
    USER_DATA.each do |user|
      email = user[:email]
      new = User.find_or_initialize_by(email: email)
      new.assign_attributes(user)
      new.save!
    end
  end
end
