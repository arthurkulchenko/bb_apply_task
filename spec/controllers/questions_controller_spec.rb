require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let!(:question){ create(:question) }
  describe "GET#index" do
    before { get :index }
    it_behaves_like("Responce is OK")
    it 'assign all questions' do
      expect(assigns(:questions)).to eq(Question.all)
    end

  end

  describe "POST#create" do
    it 'assign all questions' do
      expect(assigns(:questions)).to eq(Question.all)
    end

    it 'assign new question' do
      expect(assigns(:question)).to be_a_new(Question)
    end

    context 'question created' do
      let(:request) { post :create, params: { question: attributes_for(:question) } }

      it "eventually it creates new question" do
        expect{ request }.to change(Question, :count).by(1)
      end
      it_behaves_like("Responce is OK")

    end
    context 'question NOT created' do
      let(:request_with_error) { post :create, params: { question: attributes_for(:empty_question) } }
      it 'assign new question' do
        expect{ request_with_error }.to change(Question, :count).by(0)
      end

      let(:request) { post :create, params: { question: attributes_for(:question) } }

    end
  end

  describe 'GET#show' do
    it_behaves_like("Responce is OK")

    it 'shows question' do
      pending 'Not implemented...'
    end

    it 'assigns question replies' do
      pending 'Not implemented...'
    end
  end
end
