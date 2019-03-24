require 'rails_helper'

RSpec.describe Review, type: :model do
  it_behaves_like "Post validation"

  # TODO scope test
  # scope :by_latest,-> { order(created_at: :desc) }

  # def time
  #   created_at.strftime("%e %b %y - %H:%M")
  # end
end
