class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Review.find(params[:restaurant_id])
    # if @review.save
    redirect_to review_path(@review)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
