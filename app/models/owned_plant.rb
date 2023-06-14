class OwnedPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_many :log_books, dependent: :destroy
end
