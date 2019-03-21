class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(reviews_params)
    if @review.save
      redirect_to reviews_path
    else
      render :new, notice: @review.errors.full_messages
    end
  end

  def reviews_params
    params.require(:review).permit(:title, :content)
  end
end
