class NewQuestionMailer < ApplicationMailer
  def new_question_email title, content, email
    @title = title
    @content = content
    mail(to: email, subject: title)
  end
end
