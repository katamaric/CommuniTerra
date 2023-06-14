class AddTitleToKeptPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :kept_plants, :title, :string
  end
end
