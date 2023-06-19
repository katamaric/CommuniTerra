class CreateLogBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :log_books do |t|
      t.references :owned_plant, null: false, foreign_key: true
      t.datetime :entry_date
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
