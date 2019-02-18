class Scooter < ApplicationRecord
  mount_uploader :img, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_everything,
    against: [:make, :model, :year, :location, :reg_plate, :price],
    # may want to add a filter for year, price, and location later instead of user search
    # did not add owner(user) search
    using: {
      tsearch: { prefix: true }
    }

  # belongs_to :user, foreign_key: "owner_id", class_name: "User"
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :reg_plate, uniqueness: true
  validates_presence_of :make, :model, :year, :location, :reg_plate, :price
  validates_numericality_of :price
end
