class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :user, polymorphic: true # extra request
  validates :user_id, :user_type, :content, presence: true
  validates :user_type, inclusion: { in: %w(PlainUser AdminUser), message: "%{value} is wrong value" }
  validate do |reply|
    errors.add(:reply_utensils, 'You are not the owner of the question') if user_authorization_check_pass
  end

  private

  def user_authorization_check_pass
    user_id != question.plain_user_id if question && ( user_type == "PlainUser" )
  end

end
