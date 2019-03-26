class Question < ApplicationRecord
  validates :title, :content, :plain_user, presence: true
  belongs_to :plain_user
  has_many :replies

  scope :by_latest,-> { order(created_at: :desc) }

  def time
    created_at.strftime("%e %b %y - %H:%M")
  end

end
