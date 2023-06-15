class PlantSitting < ApplicationRecord
  belongs_to :user
  
  has_many :kept_plants
end
