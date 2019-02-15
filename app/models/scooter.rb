class Scooter < ApplicationRecord
  mount_uploader :img, PhotoUploader
  # belongs_to :user, foreign_key: "owner_id", class_name: "User"
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :reg_plate, uniqueness: true
  validates_presence_of :make, :model, :year, :location, :reg_plate, :price
  validates_numericality_of :price
end
