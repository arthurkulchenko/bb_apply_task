FactoryBot.define do
  factory :admin_user do
    email              { Faker::Internet.email }
    encrypted_password { Faker::Crypto.md5 }
  end
end
