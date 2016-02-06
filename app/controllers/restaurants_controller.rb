  class RestaurantsController < ApplicationController
  before_action :load_reservations

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # Add reservation.new to this page because reservation form is on the restaurant#show page
    # For the moment
    @reservation = @restaurant.reservations.build
  end

  private

  def load_reservations
    @reservations = Restaurant.find(params[:id]).reservations
  end
end
