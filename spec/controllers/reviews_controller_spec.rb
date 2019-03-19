require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:review){ create(:review) }
  describe "GET#index" do
    before { get :index }
    it_behaves_like("Responce is OK")
    it 'assign all reviews' do
      pending
    end
  end

  describe "GET#new" do
    before { get :new }
    it_behaves_like("Responce is OK")
    it 'assign new review' do
      pending
    end
  end

  describe "POST#create" do
    context 'review created' do
      let(:request){ post :create, review: attributes(:review) }
      it_behaves_like("Responce is OK")
      it "eventually it creates new review" do
        expect{request}.to change(Reviews, count).by(1)
      end
    end
    context 'review not created' do
    end
  end
end
