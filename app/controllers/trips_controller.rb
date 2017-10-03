class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def show
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to passenger_path(@trip.passenger_id)
    else
      render "edit"
    end
  end

  def rating
  end

  def new
      @trip = Trip.new
  end

  def create
    @trip =Trip.new(trip_params)

  end


  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

  def find_trip
    @trip= Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:cost, :rating, :driver_id, :passenger_id)
  end

end
