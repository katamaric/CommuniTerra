class AllotmentUser < ApplicationRecord
  belongs_to :member, class_name: 'User'
  belongs_to :allotment

  validate :check_admin_membership, on: :create

  private

  def check_admin_membership
    if allotment.admin_id == member_id
      errors.add(:base, "Vous êtes déjà administrateur de ce potager.")
    end
  end
end
