FactoryBot.define do
  sequence(:email) { |n| "user.number-#{n+n}@example.com" }
  factory :admin_user do
    email
    # encrypted_password '12345678'
  end
end
