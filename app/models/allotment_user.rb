class AllotmentUser < ApplicationRecord
  belongs_to :admin
  belongs_to :member
  belongs_to :allotment
end
