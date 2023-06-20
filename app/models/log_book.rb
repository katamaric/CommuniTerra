class LogBook < ApplicationRecord
  validates :entry_date, presence: true
  validates :title, presence: true 
  validates :content, presence: true 
  belongs_to :owned_plant
  enum mood: { no_data: 0, awful: 1, bad: 2, okay: 3, great: 4, amazing: 5 }

  before_validation :set_default_entry_date

  private

  def set_default_entry_date
    self.entry_date ||= Time.now
  end

end
