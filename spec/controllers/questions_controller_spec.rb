require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:user){create(:plain_user, :with_email)}
  let(:good_question){ create(:question, plain_user: user, title: "hi", content: "whats new?") }
  let(:replies){ create_list(:reply, 3, user: user, question: good_question)}

  describe "|GET#index|" do
    before { get :index }
    it_behaves_like("Responce is OK")
    it 'assign all questions' do
      expect(assigns(:questions)).to eq(Question.all)
    end

  end
  describe '|GET#show|' do
    before { get :show, params: { id: good_question }}
    it_behaves_like("Responce is OK")

    it 'shows question' do
      expect(assigns(:question)).to eq(good_question)
    end
  end

  describe "|POST#create|" do

    context 'question creattion::' do
      let(:request) { post :create, params: { question: attributes_for(:question, :with_user)}}

      it 'assign all questions' do
        request
        expect(assigns(:questions)).to eq(Question.all)
      end

      it "eventually creates new question" do
        expect(good_question.plain_user.email).to eq(user.email)
        expect(good_question.plain_user).to eq(user)
        expect{ request }.to change(Question, :count).by(1)
      end
      it_behaves_like("Responce is OK")

      it 'redirects to @question' do
        request
        redirect_to good_question
      end

    end
    context 'question NOT created::' do
      it 'fail to crate new question' do
        expect{
          post :create, params: { question:  {"attributes_for(:question)": "fail"} }
        }.to_not change(Question, :count)
      end

    end
  end
end
