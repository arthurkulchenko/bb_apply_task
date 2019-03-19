require 'rails_helper'

RSpec.describe Question, type: :model do
  it_behaves_like "Post validation"
end
