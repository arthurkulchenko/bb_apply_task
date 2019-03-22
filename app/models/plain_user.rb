class PlainUser < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "wrong email format" }
end
