class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(reviews_params)
    if @review.save
      redirect_to reviews_path
    else
      @errors = @review.errors.full_messages
      render 'index'
    end
  end

  def reviews_params
    params.require(:review).permit(:title, :content)
  end
end
