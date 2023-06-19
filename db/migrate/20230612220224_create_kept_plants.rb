class CreateKeptPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :kept_plants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :owned_plant, null: false, foreign_key: true
      t.integer :quantity
      t.integer :plantlist_number, default: 1
      t.date :start_date
      t.date :end_date
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
