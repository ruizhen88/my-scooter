class Scooter < ApplicationRecord
  mount_uploader :img, PhotoUploader
  geocoded_by :location
  after_validation :geocode
  # , if: :will_save_change_to_location?

  include PgSearch
  pg_search_scope :search_by_everything,
    against: [:make, :model, :year, :location, :reg_plate, :price],
    using: {
      tsearch: { prefix: true }
    }
    # may want to add a filter for year, price, and location later instead of user search
    # did not add owner(user) search

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :reg_plate, uniqueness: true
  validates_presence_of :make, :model, :year, :location, :reg_plate, :price
  validates_numericality_of :price
end
