class KeptPlant < ApplicationRecord
  belongs_to :plant_sitting, optional: true
  belongs_to :owned_plant
end