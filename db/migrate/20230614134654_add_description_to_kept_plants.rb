class AddDescriptionToKeptPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :kept_plants, :description, :text
  end
end
