class User < ApplicationRecord
  mount_uploader :image, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :bookings, through: :scooter
  has_many :scooters, dependent: :destroy

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
