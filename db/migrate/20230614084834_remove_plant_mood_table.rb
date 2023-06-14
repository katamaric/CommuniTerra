class RemovePlantMoodTable < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :log_books, :plant_moods
    drop_table :plant_moods
    add_column :log_books, :mood, :text
  end
end
