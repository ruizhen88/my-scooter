# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'

Review.destroy_all
Booking.destroy_all
Scooter.destroy_all
User.destroy_all

puts 'Creating database entries...'

STATUS = ["Accepted", "Pending", "Cancelled", "Completed"]
# images = asset_url("avatar_pic_sonia.jpg")
IMAGES = ["https://res.cloudinary.com/dx9npfvqu/image/upload/v1550221123/daniel-von-appen-266183-unsplash.jpg", "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550220696/home_vespa.jpg", "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550221138/nick-fewings-1307214-unsplash.jpg", "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550221128/simon-roth-800367-unsplash.jpg"]

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

3.times do
  user = User.new(
      first_name: Faker::Name.first_name.to_s,
      last_name: Faker::Name.last_name.to_s,
      email: Faker::Internet.email,
      password: "somethingelse2018"
      )
  user.save

  5.times do
    scooter = Scooter.new(
      make: Faker::Vehicle.make.to_s,
      model: Faker::Vehicle.model.to_s,
      year: rand(2010..2018).to_i,
      location: ["Canggu", "Ubud", "Denpasar", "Seminyak", "Kuta", "Uluwatu"].sample,
      reg_plate: Faker::Alphanumeric.alphanumeric(10),
      price: rand(10..20),
      user: user
    )
    scooter.remote_img_url = IMAGES.sample
    scooter.save

    3.times do
      booking = Booking.new(
      amount: rand(10..20),
      scooter: scooter,
      user: user,
      start_date: Faker::Date.backward(120),
      end_date: Faker::Date.forward(120),
      status: STATUS.sample
      )
      booking.save

      3.times do
        review = Review.new(
          booking: booking,
          content: Faker::Hipster.sentences,
          rating: rand(1..5)
        )
        review.save
      end
    end
  end
end


# booking = Booking.new(
#   amount: rand(10..20),
#   scooter: scooter,
#   user: user,
#   start_date: "01-02-2019",
#   end_date: "10-02-2019",
#   status: STATUS.sample
# )
# booking.save

# review = Review.new(
#     booking: booking,
#     content: "some random string review",
#     rating: rand(1..5)
#   )
# review.save

puts 'Finished!'
