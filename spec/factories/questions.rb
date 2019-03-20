FactoryBot.define do
  factory :question do
    title {"#{Faker::GreekPhilosophers.name} says:"}
    content {"#{Faker::GreekPhilosophers.quote}"}
  end
end
