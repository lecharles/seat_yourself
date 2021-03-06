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
    @restaurant = Restaurant.where(id: @reservation.restaurant_id)

      if @reservation.save
        redirect_to root_path, notice: "Reservations created successfully!"
      else
        # Won't work with render, works with redirect_to. Not sure why
        redirect_to root_path, notice: "Reservation creation failed. Please try again"
      end

  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to restaurant_path(@restaurant), notice: "Reservation successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurant_path(@restaurant), notice: "Reservation successfully deleted!"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_field, :time_field, :party_size, :user_id, :restaurant_id, :id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
