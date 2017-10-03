class PassengersController < ApplicationController

  before_action :find_passenger, only: [:show, :edit, :update, :destroy]

  def index
    @passengers = Passenger.all.order("created_at DESC")
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :vin)
  end

  def find_passenger
    @passenger = Passenger.find(params[:id])
  end


end
