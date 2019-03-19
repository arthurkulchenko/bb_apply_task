class Review < Post
  validates :title, :content, presence: true
end
