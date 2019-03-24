require 'rails_helper'

RSpec.describe Question, type: :model do
  it_behaves_like "Post validation"
  it { should belong_to :plain_user }
  it { should have_many :replies }
  it { should accept_nested_attributes_for(:replies).allow_destroy(true) }

end
