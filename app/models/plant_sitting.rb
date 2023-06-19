class PlantSitting < ApplicationRecord
  belongs_to :plantsitter, class_name: 'User'
  has_many :kept_plants, dependent: :destroy
  has_many :owned_plants, through: :kept_plants
end
