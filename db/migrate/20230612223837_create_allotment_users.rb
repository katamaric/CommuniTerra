class CreateAllotmentUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :allotment_users do |t|
      t.references :member, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
      t.references :allotment, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end