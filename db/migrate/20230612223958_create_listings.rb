class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :listing_title
      t.string :item_name
      t.text :description
      t.float :price
      t.integer :quantity
      t.references :delivery, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end