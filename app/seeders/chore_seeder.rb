class ChoreSeeder
  CHORE_DATA = [
    {name: "Take Out Trash", description: "From: kitchen, bathroom, and office", house: House.first, due: "2019-05-15 19:12:19"},
    {name: "Do Dishes", description: "Empty sink, load-up the dishwater, run the dishwasher, empty the dishwasher", house: House.first, due: "2019-05-16 19:12:19"},
    {name: "Clean Kitchen", description: "Counters, sink, table, and floors", house: House.first, due: "2019-05-17 19:12:19"},
    {name: "Empty Fridge", description: "Some of the stuff has been there for awhile, if it is yours - throw it in the trash", house: House.first, due: "2019-05-18 19:12:19"},
    {name: "Have One", description: "Have a claimed chore", house: House.first, due: "2019-05-19 19:12:19", status: "claimed", user: User.first},
    {name: "Have Another", description: "Have two claimed chores", house: House.first, due: "2019-05-20 19:12:19", status: "claimed", user: User.first}
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
