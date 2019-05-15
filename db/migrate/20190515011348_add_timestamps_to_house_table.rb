class AddTimestampsToHouseTable < ActiveRecord::Migration[5.2]
  def change
    change_table :houses do |t|
      t.timestamps
    end
  end
end
