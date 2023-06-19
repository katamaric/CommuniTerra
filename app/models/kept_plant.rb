class KeptPlant < ApplicationRecord
  belongs_to :owned_plant
  belongs_to :plantsitasker, through: :owned_plant, class_name: 'User'

  has_many :plant_sittings, dependent: :destroy
end
