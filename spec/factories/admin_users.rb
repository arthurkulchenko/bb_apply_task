FactoryBot.define do
  sequence(:email) { |n| "user.number-#{n+n}@example.com" }
  factory :admin_user do
    email
    password '12345678'
    password_confirmation '12345678'
  end
end
