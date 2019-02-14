class Booking < ApplicationRecord
  belongs_to :scooter
  # belongs_to :user, foreign_key: "customer_id", class_name: "User"
  belongs_to :user

  validates_numericality_of :amount

  # validates :after_today
  # validates_with DateRangeValidator

  private

  def after_today
    # return false if start date is less than today
    Date.today <= :start_date
  end
end
