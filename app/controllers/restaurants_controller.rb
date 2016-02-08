  class RestaurantsController < ApplicationController
  before_action :load_reservations, only: :show
  before_action :check_availability?, only: :create

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

  def check_availability?
    occupied_seats = Reservation.where(restaurant_id: reservation.restaurant_id, time: reservation.time).sum(:party_size)

    occupied_seats + self.party_size <= Restaurant.find(self.restaurant_id).capacity
  end

end
