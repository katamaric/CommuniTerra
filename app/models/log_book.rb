class LogBook < ApplicationRecord
  validates :entry_date, presence: true
  validates :title, presence: true 
  validates :content, presence: true 
  belongs_to :owned_plant
end
