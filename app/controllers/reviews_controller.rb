class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new()
  end

  def create
    @review = Review.new(reviews_params)
    @review.save unless @review.errors.any?
  end

  def reviews_params
    params.require(:review).permit(:title, :content)
  end
end
