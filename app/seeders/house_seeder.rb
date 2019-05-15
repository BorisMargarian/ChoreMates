class HouseSeeder
  HOUSE_DATA = [
    {name: "House Targaryen", password: "fireandblood"},
    {name: "House Lannister", password: "hearmeroar"},
    {name: "House Greyjoy", password: "wedonotsow"},
    {name: "House Baratheon", password: "oursisthefury"},
    {name: "House Tyrell", password: "growingstrong"},
    {name: "House Stark", password: "winteriscoming"}
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
