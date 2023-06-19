class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
