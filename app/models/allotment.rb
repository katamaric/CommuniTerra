class Allotment < ApplicationRecord
  belongs_to :admin, class_name: 'User'
  has_many :allotment_users, dependent: :destroy
  has_many :members, through: :allotment_users, source: :member
  has_many :owned_plants
end
