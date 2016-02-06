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
    @reservation.user = current_user

    temp_diners = @restaurant.total_diners_at_time(@reservation.time) + @reservation.party_size

    if @restaurant.total_diners_at_time(@reservation.time) + temp_diners <= capacity
      if @reservation.save
        redirect_to restaurant_path(@restaurant), notice: "Reservations created successfully!"
      else
        # Won't work with render, works with redirect_to. Not sure why
        redirect_to restaurant_path(@restaurant), notice: "Reservation creation failed. Please try again"
      end
    else
      flash[:alert] = "There are no seats available for that time. Please try again."
      render :new
    end

  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_field, :time_field, :party_size, :user_id, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
