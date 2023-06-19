class CreatePlantSittings < ActiveRecord::Migration[7.0]
  def change
    create_table :plant_sittings do |t|
      t.references :sitter, foreign_key: { to_table: :users }
      t.references :asker, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
