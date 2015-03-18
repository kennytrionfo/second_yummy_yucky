class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @restaurants = Restaurant.all
    respond_with(@restaurants)
  end

  def show
    respond_with(@restaurant)
  end

  def new
    @restaurant = current_user.restaurants.build
    respond_with(@restaurant)
  end

  def edit
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    @restaurant.save
    respond_with(@restaurant)
  end

  # def update
  #   @restaurant.update(restaurant_params)
  #   respond_with(@restaurant)
  # end

  def update
    if @restaurant.update(restaurant_params)
     redirect_to @restaurant, notice: "restaurant was Successfully updated"
    else
     render 'edit'
    end
  end

  def destroy
    @restaurant.destroy
    respond_with(@restaurant)
  end

  private
    def find_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :address, :comments)
    end
end
