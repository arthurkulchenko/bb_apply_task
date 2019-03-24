require 'rails_helper'

RSpec.describe RepliesController, type: :controller do

  describe 'POST#create' do
    let(:user){create(:plain_user, :with_email)}
    let(:question){create(:question, plain_user: user)}
    let(:reply){create(:reply, user: user, question: question)}
    let(:request){post :create, params: { reply: attributes_for(:reply) }}
    # let(:request_with_errors){post :create, params: { reply: attributes_for(:reply) }}
    # before {post}

    it 'is belongs to question' do
      # request
      expect{ request }.to change(Reply, :count).by(1)
      # expect(reply.question).to eq(question)
    end

    # it 'sets right user' do
    #   pending 'Not Implemented'
    # end

    # it 'saves instans' do
    #   pending 'Not Implemented'
    # end

    # it 'redirects to question in seccess case, so new data appears' do
    #   # request
    #   # redirect_to reply.question
    # end

    # it 'render the same question if errors are present' do
    #   request_with_errors
    # end

  end

end
