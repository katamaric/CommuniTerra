class Order < ApplicationRecord
  belongs_to :user
  has_many :order_listings, dependent: :destroy
  has_many :listings, through: :order_listings

  after_create :order_send

  def order_send
    OrderMailer.order_confirmation(user, self).deliver_now
  end  
end
