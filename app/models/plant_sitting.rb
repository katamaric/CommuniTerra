class PlantSitting < ApplicationRecord
  belongs_to :sitter, class_name: 'User', optional: true
  belongs_to :asker, class_name: 'User'
  has_many :kept_plants
end
