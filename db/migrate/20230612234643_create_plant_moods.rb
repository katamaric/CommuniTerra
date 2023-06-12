class CreatePlantMoods < ActiveRecord::Migration[7.0]
  def change
    create_table :plant_moods do |t|
      t.string :plant_mood

      t.timestamps
    end
  end
end
