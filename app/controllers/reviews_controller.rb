class ReviewsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def reviews_params
    params.require(:review).permit(:title, :content)
  end
end
