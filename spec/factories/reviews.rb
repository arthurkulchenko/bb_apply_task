FactoryBot.define do
  factory :review do
    title   {'some title'}
    content {'contnet'}
  end

  factory :empty_review, class: Review do
    title   {nil}
    content {nil}
  end
end
