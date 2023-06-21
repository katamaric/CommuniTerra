class PlantSitting < ApplicationRecord
  belongs_to :sitter, class_name: 'User', optional: true
  belongs_to :asker, class_name: 'User'
  has_many :kept_plants

  validate :cannot_sit_own_plants

  private

  def cannot_sit_own_plants
    if sitter_id == asker_id
      errors.add(:sitter_id, "Vous ne pouvez pas garder vos propres plantes !")
    end
  end
end
