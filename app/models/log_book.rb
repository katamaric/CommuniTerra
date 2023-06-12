class LogBook < ApplicationRecord
  belongs_to :owned_plant
  belongs_to :mood
end
