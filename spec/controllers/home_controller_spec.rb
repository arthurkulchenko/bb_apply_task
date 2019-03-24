require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it_behaves_like("Responce is OK")
  end

end
