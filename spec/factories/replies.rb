FactoryBot.define do
  # let(:question){ create(:question) }
  factory :reply do
    content  { Faker::TvShows::Friends.quote }

    trait :plain_user_reply do
      user_type {"PlainUser"}
      user_id { PlainUser.create(title: Faker::TvShows::StarTrek.character, email: Faker::Internet.email).id }
    end

    trait :correct_reply do
      user_type {"PlainUser"}
      user_id { PlainUser.create(title: Faker::TvShows::StarTrek.character, email: Faker::Internet.email).id }
      question { Question.create(user: user) }
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
