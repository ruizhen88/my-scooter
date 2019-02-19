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
    password: "password",
    image: "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550533279/User%20Profile%20Pictures/bigRom.jpg"
  },
  John: {
    first_name: "John",
    last_name: "Higgins",
    email: "johnhiggins@outlook.ie",
    password: "password",
    image: "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550533280/User%20Profile%20Pictures/bigJohn.png"
  },
  Kane: {
    first_name: "Kane",
    last_name: "Ryans",
    email: "kaneryans@live.com",
    password: "password",
    image: "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550533279/User%20Profile%20Pictures/bigKane.jpg"
  },
  Yejin: {
    first_name: "Yejin",
    last_name: "Jung",
    email: "yejiin.jung@gmail.com",
    password: "password",
    image: "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550533280/User%20Profile%20Pictures/bigYej.jpg"
  },
}


Users.each do |userKey, userValue|
  new_user = User.new(
    first_name: userValue[:first_name],
    last_name: userValue[:last_name],
    email: userValue[:email],
    password: userValue[:password]
    )
  new_user.remote_image_url = userValue[:image]
  new_user.save

  scooters = {
    Honda: {
      model: ["Activa"],
      img: "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550534415/Bike%20Photos/Honda-Activa.jpg"
    },
    TVS: {
      model: ["Jupiter", "Scooty Zest 110"],
      img: "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550534416/Bike%20Photos/TVS-Scooty-Zest.jpg"
    },
    Suzuki: {
      model: ["Access"],
      img: "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550534416/Bike%20Photos/Suzuki-Access.jpg"
    },
    Yamaha: {
      model: ["Fascino"],
      img: "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550534416/Bike%20Photos/Yamaha-Fascino.jpg"
    },
    Aprilia: {
      model: ["SR 150"],
      img: "https://res.cloudinary.com/dx9npfvqu/image/upload/v1550534413/Bike%20Photos/Aprilia-SR150.webp"
    }
  }

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
    scooter.model = scooters[scooter.make.to_sym][:model].to_a.sample
    scooter.remote_img_url = scooters[scooter.make.to_sym][:img]
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

puts 'Finished!'
