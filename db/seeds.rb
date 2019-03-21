require 'faker'
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
) if Rails.env.development? && AdminUser.find_by(email: 'admin@example.com').nil?

15.times do
  @quote = Faker::TvShows::SouthPark.quote
  Review.create(
    title: "#{Faker::TvShows::SouthPark.character} says: #{@quote.slice(0..12)}...",
    content: @quote
  )
end

5.times do
  PlainUser.create(
    name: Faker::TvShows::HowIMetYourMother.character,
    email: Faker::Internet.email
  )
end

PlainUser.all.each do |user|
  @quote = Faker::Quotes::Shakespeare.hamlet_quote
  Question.create(plain_user_id: user, title: "#{@quote.slice(0..12)}...", content: @quote)
end
