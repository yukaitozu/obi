# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
KIMONOS = ["Red Kimono", "Edo Era Kimono", "Summer Yukata", "Embroidered Mens Kimono", "Purple Yukata", "Fancy Hakama", "Bridal Kimono", "Casual Kimono", "Graduation Hakama", "Playful Kids Kimono", "Beautiful Furisode", "Yellow Yukata", "Blue Short Kimono", "Formal Green Kimono"]

Review.destroy_all
Booking.destroy_all
Listing.destroy_all
User.destroy_all

20.times do
  User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456"
  )
end

User.first(10).each do |user|
  rand(1..5).times do
    Listing.create!(user: user, title: KIMONOS.sample, price: Faker::Number.number(digits: 4), color: Listing::COLORS.sample, category: Listing::CATEGORIES.sample)
  end
end

User.last(10).each do |user|
  rand(1..3).times do
    start_date = Faker::Date.in_date_period(month: 1)
    Booking.create!(borrower: user, listing: Listing.all.sample, start_date: start_date , return_date: start_date + rand(1..3).days, approved: rand(0..2) > 0)
  end
end

User.create!(
  email: "yuka@gmail.com",
  password: "123456",
  first_name: "Yuka",
  profile_info: "I am passionate about kimonos! I have a variety of different styles of kimonos from yukatas to hakamas!"
  )

User.create!(
  email: "noemi@gmail.com",
  password: "123456",
  first_name: "Noemi",
  profile_info: "I love Japanese culture and traveling to different parts of Japan. I would love to rent a kimono and get the full Japanese experience!"
  )
