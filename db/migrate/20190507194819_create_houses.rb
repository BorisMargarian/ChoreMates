class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name, null: false, unique: true
      t.string :password, null: false
    end
  end
end
