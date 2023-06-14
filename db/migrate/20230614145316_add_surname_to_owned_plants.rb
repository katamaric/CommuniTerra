class AddSurnameToOwnedPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :owned_plants, :nickname, :string, default: nil
  end
end
