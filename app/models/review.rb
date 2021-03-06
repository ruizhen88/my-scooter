class Review < ApplicationRecord
  belongs_to :booking
  # belongs_to :scooter, through: :bookings

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
