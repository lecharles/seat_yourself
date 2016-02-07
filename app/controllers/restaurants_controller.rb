  class RestaurantsController < ApplicationController
  before_action :load_reservations, only: :show

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # Add reservation.new to this page because reservation form is on the restaurant#show page
    # For the moment
    @reservation = @restaurant.reservations.build
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, notice: "Restaurant successfully listed!"
    else render :new
    end
  end


  private

  def load_reservations
    @reservations = Restaurant.find(params[:id]).reservations
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :capacity, :owner_id)
  end

end
