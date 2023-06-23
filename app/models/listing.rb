class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :delivery

  validates :listing_title, presence: true, length: { maximum: 255 }
  validates :item_name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999999 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }, on: :create
  validates :delivery_id, presence: true, inclusion: { in: Delivery.pluck(:id) }

  has_many :cart_listings, dependent: :destroy
  has_many :carts, through: :cart_listings, dependent: :destroy
  has_many :order_listings, dependent: :destroy
  has_many :orders, through: :order_listings, dependent: :destroy

  validate :remaining_quantity_must_be_positive, on: :update

  def remaining_quantity_must_be_positive
    errors.add(:remaining_quantity, "must be greater than 0") if quantity.nil? || quantity <= 0
  end

end
