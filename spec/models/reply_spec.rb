require 'rails_helper'

RSpec.describe Reply, type: :model do
  it { should belong_to :user }
  it { should belong_to :question }

  it { should validate_presence_of :user_type }
  it { should validate_presence_of :user_id }

  let(:user){ create(:plain_user, :with_email)}
  let(:another_user){ create(:plain_user, :with_email)}
  let(:question){create(:question, plain_user: user )}

  let(:replies){create_list(:reply, 5, question: question, user: user)}
  let(:reply){create(:reply, question: question, user: user)}

  # it { expect(reply).to callback(:update_question).after(:create) }
  it 'Reply#update_question updates questions reply_amount' do
    expect(replies[0].question).to eq(question)
    expect(question.reply_amount).to eq(5)
    question.replies.create(content: 'hello', user: user)
    expect(question.reply_amount).to eq(6)
  end

  it 'should validate new questions reply utensils to user by email' do
    expect(question.plain_user).to eq(user)
    expect{question.replies.create(content: 'hello', user: user)}.to change(Reply, :count).by(1)
  end

  it 'should validate new questions reply utensils to user by email' do
    expect(question.plain_user).to_not eq(another_user)
    expect{question.replies.create(content: 'hello', user: another_user)}.to_not change(Reply, :count)
  end

  it { should validate_inclusion_of(:user_type).in_array(%w(PlainUser AdminUser)) }
  # context 'with valid user_type value' do
  #   it 'pass right value' do
  #     expect{question.replies.create(content: 'hello', user_id: user.id, user_type: 'PlainUser')}.to change(Reply, :count).by(1)
  #   end
  # end

end
