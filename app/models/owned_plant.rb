class OwnedPlant < ApplicationRecord
  belongs_to :plantsitasker, class_name: 'User'
  belongs_to :plant
  has_many :log_books, dependent: :destroy
end
