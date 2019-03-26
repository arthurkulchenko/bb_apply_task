FactoryBot.define do
  factory :question do
    title {"#{Faker::GreekPhilosophers.name} says:"}
    content {Faker::GreekPhilosophers.quote}

    trait :with_user do
      plain_user {PlainUser.create(title: Faker::TvShows::StarTrek.character, email: Faker::Internet.email)}
    end

    trait :invalid_question do
      plain_user {"my string"}
    end
  end

  factory :empty_question, class: Question do
    title {nil}
    content {nil}
  end
end
