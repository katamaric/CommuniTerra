class AllotmentUser < ApplicationRecord
  belongs_to :member, class_name: 'User'
  belongs_to :allotment
end
