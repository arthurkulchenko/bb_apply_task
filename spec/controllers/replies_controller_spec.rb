require 'rails_helper'

RSpec.describe RepliesController, type: :controller do

  describe 'POST#create' do
    let(:request) { post :create, params: { reply: attributes_for(:reply) } }
    # before { post}
    it 'is belongs to question' do
      pending 'Not Implemented'
    end
    it 'sets right user' do
      pending 'Not Implemented'
    end
    it 'saves instans' do
      pending 'Not Implemented'
    end
    it 'redirects to question in seccess case, so new data appears' do
      pending 'Not Implemented'
    end
    it 'render the same question if errors are present' do
      pending 'Not Implemented'
    end

  end

end
