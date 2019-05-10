class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :due, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :cost, default: 0
      t.string :status, default: "unclaimed"
      t.string :chore_photo

      t.timestamps
      t.belongs_to :house
      t.belongs_to :user
    end
  end
end
