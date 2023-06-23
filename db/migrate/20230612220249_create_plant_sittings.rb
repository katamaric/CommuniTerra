class CreatePlantSittings < ActiveRecord::Migration[7.0]
  def change
    create_table :plant_sittings do |t|
      t.references :sitter, foreign_key: { to_table: :users, on_delete: :cascade }
      t.references :asker, foreign_key: { to_table: :users, on_delete: :cascade }

      t.timestamps
    end
  end
end

