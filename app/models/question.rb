class Question < Post
  validates :title, :content, presence: true
end
