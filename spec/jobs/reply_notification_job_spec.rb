require 'rails_helper'

RSpec.describe ReplyNotificationJob, type: :job do
  ActiveJob::Base.queue_adapter = :test
  let(:reply){create(:reply, :correct_reply)}
  it 'create queue' do
    expect{
      ReplyNotificationJob.perform_later reply.user.email, reply.content, reply.question.title
    }.to have_enqueued_job
  end
end
