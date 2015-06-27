class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
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

  private
  def review_params
    params.require(:review).permit(:body, :score)
  end
end
