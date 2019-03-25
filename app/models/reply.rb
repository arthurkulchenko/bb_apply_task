class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :user, polymorphic: true
  validates :user_id, :user_type, presence: true
  validates :user_type, inclusion: { in: %w(PlainUser AdminUser), message: "%{value} is wrong value" }
  validate do |reply|
    errors.add(:reply_utensils, 'You are not the owner of the question') if user_authorization_check
  end

  after_create :update_question, :question_curator

  private
  # TODO - connect this two methods
  def question_curator
    if !question.admin_user_id? && ( user_type == 'AdminUser' )
      question.update(admin_user_id: user_id)
    end
  end

  def update_question
    question.update(reply_amount: question.replies.count)
  end

  def user_authorization_check
    if question && ( user_type == "PlainUser" )
      user != question.plain_user
    end
  end

end
