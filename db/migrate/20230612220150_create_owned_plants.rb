class CreateOwnedPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :owned_plants do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :plant, null: false, foreign_key: { on_delete: :cascade }
      t.references :allotment, foreign_key: { on_delete: :cascade }, optional: true
      t.integer :quantity
      t.text :description, default: nil
      t.string :nickname, default: nil

      t.timestamps
    end
  end
end
