class HouseSeeder
  HOUSE_DATA = [
    {name: "Stark", password: "winteriscoming"},
    {name: "Targaryen", password: "fireandblood"},
    {name: "Lannister", password: "hearmeroar"},
    {name: "Greyjoy", password: "wedonotsow"},
    {name: "Baratheon", password: "oursisthefury"},
    {name: "Tyrell", password: "growingstrong"}
  ]

  def self.seed!
    HOUSE_DATA.each do |house|
      name = house[:name]
      new = House.find_or_initialize_by(name: name)
      new.assign_attributes(house)
      new.save!
    end
  end
end
