class ReplyNotificationJob < ApplicationJob
  queue_as :default

  def perform email, content, question_title
    NewReplyMailer.notify_conversation_participants(email, content, question_title).deliver_now
  end
end
