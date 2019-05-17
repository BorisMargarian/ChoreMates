class ChoreSeeder
  STARK = House.find_by(name: "House Stark")
  ARYA = User.find_by(username: "AryaStark")
  JOHN = User.find_by(username: "JohnSnow")

  CHORE_DATA = [
    {name: "Take Out Trash", description: "From: kitchen, bathroom, and office", house: STARK, due: "2019-05-18 19:12:19", remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/trash.jpg"},
    {name: "Do Dishes", description: "Empty sink, load-up the dishwater, run the dishwasher, empty the dishwasher", house: STARK, due: "2019-05-20 19:12:19", remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/dishes.jpg"},
    {name: "Clean Kitchen", description: "Counters, sink, table, and floors", house: STARK, due: "2019-05-19 19:12:19", remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/kitchen.jpg"},
    {name: "Empty Fridge", description: "Some of the stuff has been there for awhile, if it is yours - throw it in the trash", house: STARK, due: "2019-05-21 19:12:19", remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/fridge.jpg"},
    {name: "Buy Supplies", description: "We need to restock on cleaning and laundry supplies", cost: 100, house: STARK, due: "2019-05-23 19:12:19", remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/supplies.jpg"},
    {name: "Slay the Night King", description: "He is invading our home and he needs to go down!", house: STARK, due: "2019-04-28 19:12:19", status: "complete", user: ARYA, remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/night-king.jpg"},
    {name: "Save King's Landing", description: "The people are suffering, someone must save them!", house: STARK, due: "2019-05-22 19:12:19", status: "claimed", user: JOHN, remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/kings-landing.jpg"}
  ]

  def self.seed!
    CHORE_DATA.each do |chore|
      name = chore[:name]
      new = Chore.find_or_initialize_by(name: name)
      new.assign_attributes(chore)
      new.save!
    end
  end
end
