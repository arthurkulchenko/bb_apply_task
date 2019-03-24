class Review < ApplicationRecord
  validates :title, :content, presence: true
  scope :by_latest,-> { order(created_at: :desc) }

  def time
    created_at.strftime("%e %b %y - %H:%M")
  end
end
