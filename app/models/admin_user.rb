class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable,
    :recoverable, :rememberable, :validatable, :trackable

  has_many :replies, as: :user

  scope :recently_online, -> { where(current_sign_in_at: (Time.now.ago(30.minutes)..Time.now)) }

  def self.send_letter question
    # TODO Admins notification
  end
end
