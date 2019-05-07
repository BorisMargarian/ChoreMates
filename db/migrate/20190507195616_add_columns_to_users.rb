class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :username, null: false
      t.belongs_to :house
    end
  end
end
