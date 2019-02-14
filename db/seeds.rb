# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
User.destroy_all
Scooter.destroy_all
Booking.destroy_all
Review.destroy_all

puts 'Creating database entries...'

STATUS = ["Accepted", "Pending", "Cancelled", "Completed"]

# *** Commented out for testing..eventually would like to loop and populate DBs with more information  ***
# 10.times do
#   users = User.new(
#     first_name: Faker::Name.first_name.to_s,
#     last_name: Faker::Name.last_name.to_s,
#     email: Faker::Internet.email
#   )
#   users.save
#   5.times do
#     scooters = (
#       make: Faker::Vehicle.make.to_s,
#       model: Faker::Vehicle.model.to_s,
#       year: rand(2010..2018),
#       location: Faker::Address.city,
#       registration_plate: "FA02 8JK",
#       img: Faker::Placeholdit.image('50x50'),
#       price: rand(10..20),
#       owner: user
#     )
#   end
# end

user = User.new(
    first_name: Faker::Name.first_name.to_s,
    last_name: Faker::Name.last_name.to_s,
    email: Faker::Internet.email,
    password: "12345"
    )
user.save

scooter = Scooter.new(
  make: Faker::Vehicle.make.to_s,
  model: Faker::Vehicle.model.to_s,
  year: rand(2010..2018).to_i,
  location: Faker::Address.city.to_s,
  reg_plate: "FA02 8JK",
  # img: Faker::Placeholdit.image('50x50'),
  price: rand(10..20),
  user_id: user
)
scooter.save

booking = Booking.new(
  amount: rand(10..20),
  scooter_id: scooter,
  user_id: user,
  start_date: "01-02-2019",
  end_date: "10-02-2019",
  status: STATUS.sample
)
booking.save

review = Review.new(
    booking_id: booking,
    content: "some random string review",
    rating: rand(1..5)
  )
review.save

puts 'Finished!'
