class Allotment < ApplicationRecord
  belongs_to :admin, class_name: 'User'
  has_many :allotment_users, dependent: :destroy
end
