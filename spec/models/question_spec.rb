require 'rails_helper'

RSpec.describe Question, type: :model do
  it_behaves_like "Post validation"
  it { should belong_to :plain_user }
  it { should have_many :replies }
  # accepts_nested_attributes_for :replies, allow_destroy: true

  # TODO Double or method stub

  # scope :by_latest,-> { order(created_at: :desc) }

  it 'Question#admin_notification notify admins after create' do
    # expect()
    # TODO add stub
  end
  # after_create :admin_notification
  # def admin_notification
  #   AdminUser.recently_online.send_letter  self
  # end

end
