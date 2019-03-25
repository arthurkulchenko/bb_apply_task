class Question < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :plain_user
  has_many :replies
  accepts_nested_attributes_for :replies, allow_destroy: true

  after_create :admin_notification

  scope :by_latest,-> { order(created_at: :desc) }

  def time
    created_at.strftime("%e %b %y - %H:%M")
  end

  private

  def admin_notification
    SendNewQuestionNotificationJob.perform_now title, content
  end

end
