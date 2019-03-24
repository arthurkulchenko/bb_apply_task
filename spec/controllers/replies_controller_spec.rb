require 'rails_helper'

RSpec.describe RepliesController, type: :controller do

  describe 'POST#create' do
    let(:user){create(:plain_user, :with_email)}
    let(:question){create(:question, plain_user: user)}
    let(:reply){create(:reply, user: user, question: question)}
    let(:request){post :create, params: { reply: attributes_for(:reply) }}

    it 'is creates reply' do
      expect{ request }.to change(Reply, :count).by(1)
    end

  end

end
