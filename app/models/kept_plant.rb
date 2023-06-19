class KeptPlant < ApplicationRecord
  belongs_to :plant_sitting
  belongs_to :owned_plant
end