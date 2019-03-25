class NewReplyMailer < ApplicationMailer
  def notify_conversation_participants email, content, question_title
    @title = question_title
    @content = content
    mail(to: email, subject: @title)
  end
end
