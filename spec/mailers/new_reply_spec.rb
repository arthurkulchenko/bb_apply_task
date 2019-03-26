require "rails_helper"

RSpec.describe NewReplyMailer, type: :mailer do
  let(:admin){create(:admin_user)}
  let(:reply){create(:reply, :correct_reply)}
  let(:mail) { NewReplyMailer.notify_conversation_participants(admin.email, reply.content, reply.question.title) }

  it "renders the headers" do
    expect(mail.to).to eq([admin.email])
    expect(mail.subject).to eq(reply.question.title)
  end

  it "renders the body" do
    expect(mail.body.encoded).to match(reply.content)
  end
end
