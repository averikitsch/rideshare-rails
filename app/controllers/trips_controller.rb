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
    if @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to passenger_path(@trip.passenger_id)
  end

  private

  def find_trip
    @trip= Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:cost, :rating, :driver_id, :passenger_id)
  end

end
