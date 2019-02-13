class Scooter < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :bookings, foreign_key: "owner_id", class_name: "User"

  validates :reg_plate, uniqueness: true
  validates_presence_of :make, :model, :year, :location, :reg_plate, :price
  validates_numericality_of :price
end
