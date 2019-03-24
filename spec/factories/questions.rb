FactoryBot.define do
  factory :question do
    title {"#{Faker::GreekPhilosophers.name} says:"}
    content {Faker::GreekPhilosophers.quote}
    plain_user {PlainUser.create(title: Faker::TvShows::StarTrek.character)}
  end

  factory :empty_question, class: Question do
    title {nil}
    content {nil}
  end
end
