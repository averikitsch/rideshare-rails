class PassengersController < ApplicationController

  before_action :find_passenger, only: [:show, :edit, :update, :destroy]

  def index
    @passengers = Passenger.order(:name)
    if params[:search]
      @passengers = Passenger.search(params[:search]).order(:name)
    else
      @passengers = Passenger.all.order(:name)
    end
  end

  def show
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @passenger.update(passenger_params)
      redirect_to passenger_path(@passenger)
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
    params.require(:passenger).permit(:name, :phone_number)
  end

  def find_passenger
    @passenger = Passenger.find(params[:id])
  end


end
