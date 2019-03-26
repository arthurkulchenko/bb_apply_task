require "rails_helper"

RSpec.describe NewQuestionMailer, type: :mailer do
  let(:admin){create(:admin_user)}
  let(:question){create(:question, :with_user)}
  let(:mail) { NewQuestionMailer.new_question_email(question.title, question.content, admin.email) }

  it "renders the headers" do
    expect(mail.to).to eq([admin.email])
    expect(mail.subject).to eq(question.title)
  end

  it "renders the body" do
    expect(mail.body.encoded).to match(question.content)
  end
end
