class UserSeeder
  USER_DATA = [
    {username: "BorisMargarian", email: "margarian.boris@gmail.com", password: "123456"}
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
