require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:review){ create(:review) }
  describe "GET#index" do
    before { get :index }
    it_behaves_like("Responce is OK")
    it 'assign all reviews' do
      expect(assigns(:reviews)).to eq(Review.all)
    end
  end

  describe "GET#new" do
    before { get :new }
    it_behaves_like("Responce is OK")
    it 'assign new review' do
      expect(assigns(:review)).to be_a_new(Review)
    end
  end

  describe "POST#create" do

    context 'review created' do
      let(:request) { post :create, params: { review: attributes_for(:review) } }

      it "eventually it creates new review" do
        expect{ request }.to change(Review, :count).by(1)
      end

    end
    context 'review NOT created' do
      let(:request_with_error) { post :create, params: { review: attributes_for(:empty_review) } }
      it 'assign new review' do
        expect{ request_with_error }.to change(Review, :count).by(0)
      end

      let(:request) { post :create, params: { review: attributes_for(:review) } }

    end
  end
end
