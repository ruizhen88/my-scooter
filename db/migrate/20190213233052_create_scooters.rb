class CreateScooters < ActiveRecord::Migration[5.2]
  def change
    create_table :scooters do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :location
      t.string :reg_plate
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
