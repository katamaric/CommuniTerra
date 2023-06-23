class CreateOrderListings < ActiveRecord::Migration[7.0]
  def change
    create_table :order_listings do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
