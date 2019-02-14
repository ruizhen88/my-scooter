class AddImageColumnToScooters < ActiveRecord::Migration[5.2]
  def change
    add_column :scooters, :img, :string
  end
end
