class AddDatesToKeptPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :kept_plants, :start_date, :date
    add_column :kept_plants, :end_date, :date
  end
end
