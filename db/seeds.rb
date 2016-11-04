# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  user = User.create!(
  email: Faker::Internet.free_email,
  password: Faker::Internet.password
  )
end

100.times do
  User.all.sample.posts << Post.create!(
    chirp:  Faker::Lorem.sentence
    )
end
