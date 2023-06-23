class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :owned_plants, dependent: :destroy
         has_many :plants, through: :owned_plants, dependent: :destroy
         has_many :listings, dependent: :destroy
         has_many :orders, dependent: :destroy
         has_many :order_listings, through: :listings, dependent: :destroy
         has_many :kept_plants, through: :owned_plants, dependent: :destroy
        # The following lines are commented out as a reminder of dependencies, but cascading deletions are made in migrations.
        #  has_many :allotments, foreign_key: :admin_id, as: :admin, dependent: :destroy
        #  has_many :allotment_users, foreign_key: :member_id, as: :member, dependent: :destroy
        #  has_many :allotments, through: :allotment_user, dependent: :destroy
         has_one :cart, dependent: :destroy
         has_many :cart_listings, through: :cart, dependent: :destroy


  # has_many :private_sent_messages, class_name: 'PrivateMessage', foreign_key: 'sender_id'
  # has_many :private_received_messages, class_name: 'PrivateMessage', foreign_key: 'recipient_id'
  # has_many :posts, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy

  # validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{8,}\z/ }
  # validates :first_name, presence: true, length: { minimum: 2, maximum: 30 }
  # validates :last_name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email address please" }
  validates :username, presence: true, uniqueness: true

  # acts_as_messageable :table_name => "messages",                         # default 'messages'
  #                     :required   => [:topic, :body],                     # default [:topic, :body]
  #                     :class_name => "ActsAsMessageable::Message",       # default "ActsAsMessageable::Message",
  #                     :dependent  => :nullify                            # default :nullify

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  def admin?
    admin
  end

end