class ReviewsController < ApplicationController

  before_action :find_restaurant, only: [:create]

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.save
    redirect_to restaurant_path(@restaurant)
  end


  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end


   def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
