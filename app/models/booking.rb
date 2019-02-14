class Booking < ApplicationRecord
  belongs_to :scooter
  # belongs_to :user, foreign_key: "customer_id", class_name: "User"
  belongs_to :user

  validates_numericality_of :amount
end

# validate :date_range, uniqueness: { scope: [:scooter_id] }

# We can customize a method to calculate period or find from lib
# def date_range
#   # check if scooter_id are taken in each date within a period
#   if expiration_date.present? && expiration_date < Date.today
#     errors.add(:expiration_date, "scooter already in use")
#   end
# end

# reference:
# validates :ingredient_id, presence: true, uniqueness: { scope: [:cocktail_id] }
