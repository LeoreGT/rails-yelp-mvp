class RestaurantsController < ApplicationController

 before_action :set_restaurant, only: [:show, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = @restaurant.reviews
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def create
    strong_params = restaurant_parameters
    strong_params[:category].downcase!
    @restaurant = Restaurant.new(strong_params)
    if @restaurant.save
     redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_parameters
      params.require(:restaurant).permit(:name, :address, :category)
    end
end
