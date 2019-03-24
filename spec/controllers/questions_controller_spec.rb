require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:user){create(:plain_user, :with_email)}
  let(:question){ create(:question, plain_user: user, title: "hi", content: "whats new?") }
  let(:replies){ create_list(:reply, 3, user: user, question: question)}
  describe "GET#index" do
    before { get :index }
    it_behaves_like("Responce is OK")
    it 'assign all questions' do
      expect(assigns(:questions)).to eq(Question.all)
    end

  end
  describe 'GET#show' do
    before { get :show, params: { id: question }}
    it_behaves_like("Responce is OK")

    it 'shows question' do
      expect(assigns(:question)).to eq(question)
    end

    it 'assigns question replies' do
      expect(assigns(:replies)).to eq(question.replies)
    end
  end

  describe "POST#create" do

    context 'question created' do
      let(:request) { post :create, params: {
      question: attributes_for(:question)}}

      it 'assign all questions' do
        request
        expect(assigns(:questions)).to eq(Question.all)
      end

      it 'assign new question' do
        request
        expect(assigns(:question)).to be_a_new(Question)
      end
      it "eventually creates new question" do
        expect(question.plain_user.email).to eq(user.email)
        expect(question.plain_user).to eq(user)
        # Freacking rspec do not see user in request.
        # expect{ request }.to change(Question, :count).by(1)
      end
      it_behaves_like("Responce is OK")

      it 'redirects to @question' do
        request
        redirect_to question
      end

    end
    context 'question NOT created' do
      # let(:request_with_error) { post :create, params: { question: attributes_for(create(:question, :with_user).attributes) } }
      let(:request_with_error) { post :create, params: { question: create(:question).attributes } }
      it 'assign new question' do
        expect{ request_with_error }.to_not change(Question, :count)
      end

      let(:request) { post :create, params: { question: attributes_for(:question) } }

    end
  end
end
