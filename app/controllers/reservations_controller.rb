class ReservationsController < ApplicationController
  before_action :load_restaurant

  def show
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)

    if @reservation.save
      redirect_to restaurant_path(@restaurant), notice: "Reservations created successfully!"
    else
      render restaurant_path(@restaurant)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size, :user_id, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
