class SendNewQuestionNotificationJob < ApplicationJob
  queue_as :default

  def perform title, content
    AdminUser.presumably_offline.each do |admin|
      NewQuestionMailer.new_question_email(title, content, admin.email).deliver_now
    end
  end
end
