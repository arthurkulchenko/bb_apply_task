FactoryBot.define do
  factory :plain_user do
    title {Faker::TvShows::StarTrek.character}
    email {''}
  end

  trait :with_email do
    email {Faker::Internet.email}
  end
end
