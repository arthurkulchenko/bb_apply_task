require 'rails_helper'

RSpec.describe Question, type: :model do
  it_behaves_like "Post validation"
  it { should belong_to :plain_user }
  it { should have_many :replies }

end
