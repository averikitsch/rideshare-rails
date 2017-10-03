class PassengersController < ApplicationController

  before_action :find_passenger, only: [:show, :edit, :update, :destroy]

  def index
    @passengers = Passenger.all.order("created_at DESC")
  end

  def show
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
  end

  def edit
  end

  def update
    if @passenger.update(passenger_params)
      redirect_to passengers_path(@passenger)
    else
      render "edit"
    end
  end

  def destroy
    @passenger.destroy
    redirect_to passengers_path
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :vin)
  end

  def find_passenger
    @passenger = Passenger.find(params[:id])
  end


end
