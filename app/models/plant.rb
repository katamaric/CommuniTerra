class Plant < ApplicationRecord
  has_many :allotments, through: :owned_plants
  has_many :owned_plants
  has_many :owners, through: :owned_plants, source: :user
  has_many :plant_sittings
  has_many :kept_plants

  def self.ransackable_attributes(auth_object = nil)
    ["cold_resistance_description", "cold_resistance_level", "common_name", "created_at", "density", "description", "exposure_description", "exposure_level", "flowering", "foliage", "harvest", "id", "latin_name", "maintenance_description", "maintenance_level", "mature_height", "mature_width", "planting", "pruning", "specie", "updated_at", "vegetation", "water_requirement_description", "water_requirement_level"]
  end

end