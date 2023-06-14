class Plant < ApplicationRecord
  has_many :allotments, through: :owned_plants
  has_many :owned_plants
  has_many :owners, through: :owned_plants, source: :user
  has_many :plant_sittings
  has_many :kept_plants
end