require 'rails_helper'

RSpec.describe RepliesController, type: :controller do

  describe 'POST#create' do
    let(:user){create(:plain_user, :with_email)}
    let(:question){create(:question, plain_user: user)}
    let(:reply){create(:reply, user: user, question: question)}

    let(:request){
      post :create, params: {
        question_id: question,
        reply: {
          "email": user.email,
          "content": "Hey-la-la-ley",
          "user_type": "PlainUser"
        }
      }
    }

    it 'is creates reply' do
      expect{ request }.to change(Reply, :count).by(1)
    end

  end

end
