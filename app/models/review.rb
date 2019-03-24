class Review < ApplicationRecord
  validates :title, :content, presence: true


  def time
    created_at.strftime("%e %b %y - %H:%M")
  end
  scope :by_latest,-> { order(created_at: :desc) }
end
