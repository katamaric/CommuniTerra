class RemovePlantMoodIdFromLogBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :log_books, :plant_mood_id, :bigint
  end
end
