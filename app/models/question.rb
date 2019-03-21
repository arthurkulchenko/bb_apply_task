class Question < Post
  validates :title, :content, presence: true
  belongs_to :user
  has_many :replies

  scope :by_latest,-> { order(created_at: :desc) }

  def time
    created_at.strftime("%e %b %y - %H:%M")
  end

  def replies_amount
    # replies.count
    0
  end
end
