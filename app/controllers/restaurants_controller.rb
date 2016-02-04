class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # Add reservation.new to this page because reservation form is on the restaurant#show page
    # For the moment
    @reservation = Reservation.new
  end
end
