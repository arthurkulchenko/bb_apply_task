require 'rails_helper'

RSpec.describe SendNewQuestionNotificationJob, type: :job do
  ActiveJob::Base.queue_adapter = :test
  let(:question){create(:question, :with_user)}
  it 'create queue' do
    expect{
      SendNewQuestionNotificationJob.perform_later question.title, question.content
    }.to have_enqueued_job
  end
end
