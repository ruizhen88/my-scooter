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
IMAGES = ["https://res.cloudinary.com/dx9npfvqu/image/upload/v1550221123/daniel-von-appen-266183-unsplash.jpg", "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550220696/home_vespa.jpg", "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550221138/nick-fewings-1307214-unsplash.jpg", "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550221128/simon-roth-800367-unsplash.jpg"]

Users = {
  Romain: {
    first_name: "Romain",
    last_name: "Blanco",
    email: "romain.blanco@gmail.com",
    password: "password"
  },
  John: {
    first_name: "John",
    last_name: "Higgins",
    email: "johnhiggins@outlook.ie",
    password: "password"
  },
  Kane: {
    first_name: "Kane",
    last_name: "Ryans",
    email: "kaneryans@live.com",
    password: "password"
  },
  Yejin: {
    first_name: "Yejin",
    last_name: "Jung",
    email: "yejiin.jung@gmail.com",
    password: "password"
  },
}




Users.each do |userKey, userValue|
  new_user = User.new(
    first_name: userValue[:first_name],
    last_name: userValue[:last_name],
    email: userValue[:email],
    password: userValue[:password]
    )
  new_user.save


  scooters = {
    Honda: ["Activa"],
    TVS: ["Jupiter", "Scooty Zest 110"],
    Suzuki: ["Access"],
    Yamaha: ["Fascino"],
    Aprilia: ["SR 150"]
  }

  # scooters = [["Honda", "Activa"], ["TVS", ["Jupiter", "Scooty Zest 110"]], ["Suzuki", ["Access"]], ["Yamaha", ["Fascino"]], ["Aprilia", ["SR 150"]]]

  locations = ["Canggu", "Ubud", "Denpasar", "Seminyak", "Kuta", "Uluwatu"]

  5.times do
    scooter = Scooter.new(
      make: scooters.keys.sample.to_s,
      year: rand(2014..2019),
      location: locations.sample,
      reg_plate: Faker::Alphanumeric.alphanumeric(10),
      price: rand(30..45),
      user: new_user
    )
    scooter.model = scooters[scooter.make.to_sym].join
    # scooter.remote_img_url = IMAGES.sample
    scooter.save

    3.times do
      booking = Booking.new(
      scooter: scooter,
      user: new_user,
      start_date: '2019-02-19',
      end_date: '2019-02-29',
      amount: scooter.price * 10,
      status: STATUS.sample
      )
      booking.save

      # 3.times do
      #   review = Review.new(
      #     booking: booking,
      #     content: Faker::Hipster.sentences,
      #     rating: rand(1..5)
      #   )
      #   review.save
      # end
    end
  end
end








# 3.times do
#   user = User.new(
#       first_name: Faker::Name.first_name.to_s,
#       last_name: Faker::Name.last_name.to_s,
#       email: Faker::Internet.email,
#       password: "somethingelse2018"
#       )
#   user.save

#   5.times do
#     scooter = Scooter.new(
#       make: Faker::Vehicle.make.to_s,
#       model: Faker::Vehicle.model.to_s,
#       year: rand(2010..2018).to_i,
#       location: Faker::Address.city.to_s,
#       reg_plate: Faker::Alphanumeric.alphanumeric(10),
#       price: rand(10..20),
#       user: user
#     )
#     scooter.remote_img_url = IMAGES.sample
#     scooter.save

#     3.times do
#       booking = Booking.new(
#       amount: rand(10..20),
#       scooter: scooter,
#       user: user,
#       start_date: Faker::Date.backward(120),
#       end_date: Faker::Date.forward(120),
#       status: STATUS.sample
#       )
#       booking.save

#       3.times do
#         review = Review.new(
#           booking: booking,
#           content: Faker::Hipster.sentences,
#           rating: rand(1..5)
#         )
#         review.save
#       end
#     end
#   end
# end


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
