class ReservationsController < ApplicationController
  def show
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @restaurant = Restaurant.find(params[:id])
    @reservation = @restaurant.reservations.build(reservation_params)

    if @reservation.save
      redirect_to restaurant_path(@restaurant), notice: "Reservations created successfully!"
    else
      render restaurant_path(@restaurant)
    end
  end
end
