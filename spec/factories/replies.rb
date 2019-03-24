FactoryBot.define do
  # let(:question){ create(:question) }
  factory :reply do
    question { question }
    # question { question }
    content  { Faker::TvShows::Friends.quote }
    user     {}

    trait :plain_user_reply do
      user { PlainUser.create(title: Faker::TvShows::StarTrek.character, email: Faker::Internet.email) }
    end

    trait :admin_user_reply do
      user { AdminUser.create(
               title: Faker::TvShows::StarTrek.character,
               email: Faker::Internet.email,
               encrypted_password: Faker::Crypto.md5
             )
             }
    end
  end
end
