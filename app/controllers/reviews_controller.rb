class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :show, :edit, :destroy, :update]
  before_action :set_review, only: [:edit, :destroy, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(
      restaurant_id: params[:restaurant_id],
      user_id:       current_user.id,
      body:          review_params["body"],
      score:         review_params["score"],
    )
    @review.save
    redirect_to restaurant_url(@review.restaurant)
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def update
    @review.update(review_params)
    @review.save
    redirect_to restaurant_url(@review.restaurant)
  end

  def destroy
    restaurant_id = @review.restaurant_id
    @review.destroy
    redirect_to restaurant_url(restaurant_id)
  end

  private

  def review_params
    params.require(:review).permit(:body, :score)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
