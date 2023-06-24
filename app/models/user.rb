class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_plants, dependent: :destroy
  has_many :plants, through: :owned_plants, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_listings, through: :listings, dependent: :destroy
  has_many :kept_plants, through: :owned_plants, dependent: :destroy
  has_many :plant_sittings, foreign_key: :sitter_id
  has_one :cart, dependent: :destroy
        
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email address please" }
  validates :username, presence: true, uniqueness: true

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  def admin?
    admin
  end

  def member?(allotment_users)
    allotment_users.exists?(member_id: self.id)
  end

end