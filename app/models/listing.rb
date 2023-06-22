class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :delivery

  validates :listing_title, presence: true, length: { maximum: 255 }
  validates :item_name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :delivery_id, presence: true, inclusion: { in: Delivery.pluck(:id) }
end
