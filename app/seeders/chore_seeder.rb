class ChoreSeeder
  STARK = House.find_by(name: "House Stark")

  CHORE_DATA = [
    {name: "Take Out Trash", description: "From: kitchen, bathroom, and office", house: STARK, due: "2019-05-15 19:12:19", remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/trash.jpg"},
    {name: "Do Dishes", description: "Empty sink, load-up the dishwater, run the dishwasher, empty the dishwasher", house: STARK, due: "2019-05-16 19:12:19", remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/dishes.jpg"},
    {name: "Clean Kitchen", description: "Counters, sink, table, and floors", house: STARK, due: "2019-05-17 19:12:19", remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/kitchen.jpg"},
    {name: "Empty Fridge", description: "Some of the stuff has been there for awhile, if it is yours - throw it in the trash", house: STARK, due: "2019-05-18 19:12:19", remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/fridge.jpg"},
    {name: "Buy Supplies", description: "We need to restock on cleaning and laundry supplies", cost: 100, house: STARK, due: "2019-05-21 19:12:19", remote_chore_photo_url: "https://s3.amazonaws.com/chore-mates-development/defaults/no-image.gif"},
    {name: "Have One", description: "Have a claimed chore", house: STARK, due: "2019-05-19 19:12:19", status: "claimed", user: User.first},
    {name: "Have Another", description: "Have two claimed chores", house: STARK, due: "2019-05-20 19:12:19", status: "claimed", user: User.first}
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
