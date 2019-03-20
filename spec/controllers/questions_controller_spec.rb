require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:question){ create(:question) }
  describe "GET#index" do
    before { get :index }
    it_behaves_like("Responce is OK")
    it 'assign all questions' do
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  describe "GET#new" do
    before { get :new }
    it_behaves_like("Responce is OK")
    it 'assign new question' do
      expect(assigns(:question)).to be_a_new(Question)
    end
  end

  describe "POST#create" do

    context 'question created' do
      let(:request) { post :create, params: { question: attributes_for(:question) } }

      it "eventually it creates new question" do
        expect{ request }.to change(Question, :count).by(1)
      end

    end
    context 'question NOT created' do
      let(:request_with_error) { post :create, params: { question: attributes_for(:empty_question) } }
      it 'assign new question' do
        expect{ request_with_error }.to change(Question, :count).by(0)
      end

      let(:request) { post :create, params: { question: attributes_for(:question) } }

    end
  end
end
