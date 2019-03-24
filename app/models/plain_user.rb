class PlainUser < ApplicationRecord
  has_many :replies, as: :user
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "wrong email format" }
end
