class DriversController < ApplicationController
before_action :find_driver, only: [:show, :edit, :update, :destroy]

def index
  @drivers = Driver.all.order("created_at DESC")
end

private

def driver_params
  params.require(:driver).permit(:name, :phone_number)
end

def find_driver
    @driver = Driver.find(params[:id])
end


end
