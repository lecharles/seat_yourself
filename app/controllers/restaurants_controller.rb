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

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurants_path(@restaurant.id), notice: "Restaurant successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, notice: "Restaurant successfully deleted!"
  end


  private

  def load_reservations
    @reservations = Restaurant.find(params[:id]).reservations
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :capacity, :url, :owner_id)
  end

end
