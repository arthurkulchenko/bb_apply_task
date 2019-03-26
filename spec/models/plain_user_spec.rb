require 'rails_helper'

RSpec.describe PlainUser, type: :model do

  it { should have_many :replies }
  it { should have_many :questions }
  it { should allow_value(Faker::Internet.email).for(:email) }
  it { expect(PlainUser.new).to validate_uniqueness_of(:email) }

end
