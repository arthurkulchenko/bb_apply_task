class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :user, polymorphic: true
  validates :user_id, :user_type, presence: true
  validates :user_type, inclusion: { in: %w(PlainUser AdminUser), message: "%{value} is wrong value" }
  validate do |reply|
    errors.add(:reply_utensils, 'You are not the owner of the question') if user_authorization_check
  end

  after_create :update_question, :user_notification

  private

  def update_question
    @replies_amount = question.replies.count
    if !question.admin_user_id? && ( user_type == 'AdminUser' )
      question.update(admin_user_id: user_id, reply_amount: @reply_amount)
    end
    question.update(reply_amount: @reply_amount)
  end

  def user_authorization_check
    if question && ( user_type == "PlainUser" )
      user != question.plain_user
    end
  end

  def admin_responded?
    user_type == "AdminUser"
  end

  def user_notification
    # TODO not tested
    @current_user = user_type.classify.constantize.find(user_id)
    if @current_user.class == 'AdminUser'
      ReplyNotificationJob.perform_now question.plain_user.email, content, question.title
    elsif question.admin_user_id?
      ReplyNotificationJob.perform_now question.admin_user.email, content, question.title
    end
  end

end
