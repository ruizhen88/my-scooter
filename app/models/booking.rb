class Booking < ApplicationRecord
  belongs_to :scooter
  belongs_to :user
  has_one :review

  validates_numericality_of :amount

  # validates :after_today
  # validates_with DateRangeValidator

  private

  def after_today
    # return false if start date is less than today
    Date.today <= :start_date
  end
end
