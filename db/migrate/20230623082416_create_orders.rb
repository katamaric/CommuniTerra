class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.decimal :order_total

      t.timestamps
    end
  end
end