# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FACTOR = 100

FACTOR.times do |i|

  user = User.create({
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
    })

  school = user.schools.create({
    school_name: Faker::Educator.university,
    school_city: Faker::Address.city,
    root_location_lat: Faker::Address.latitude,
    root_location_lon: Faker::Address.longitude,
    school_state: Faker::Team.state,
    school_school_url: Faker::Internet.url,
    school_price_calculator_url: Faker::Internet.url,
    school_state_fips: Faker::Number.number(4),
    school_region_id: Faker::Number.number(4),
    school_locale: Faker::Number.number(4)
    })

  review = school.reviews.create({
    body: Faker::Lorem.paragraph(2),
    user_id: user.id
    })


end
