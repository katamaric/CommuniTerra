class LogBook < ApplicationRecord
  validates :entry_date, presence: true
  validates :title, presence: true 
  validates :content, presence: true 
  belongs_to :owned_plant
  enum mood: { no_data: 0, horrible: 1, médiocre: 2, OK: 3, bien: 4, super: 5 }, _default: :no_data

  before_validation :set_default_entry_date

  private

  def set_default_entry_date
    self.entry_date ||= Time.now
  end

end
