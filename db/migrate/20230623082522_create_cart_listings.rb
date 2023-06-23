class CreateCartListings < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_listings do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
