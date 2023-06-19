class PlantSitter < User
  has_many :kept_plants_as_sitter, foreign_key: :sitter_id, class_name: 'KeptPlant'
  has_many :plant_sittings_as_sitter, through: :kept_plants_as_sitter, source: :plant_sitting_as_sitter
end