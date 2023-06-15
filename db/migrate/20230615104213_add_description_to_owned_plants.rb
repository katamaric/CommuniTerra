class AddDescriptionToOwnedPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :owned_plants, :description, :text, default: nil 
  end
end
