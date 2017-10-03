class DriversController < ApplicationController
before_action :find_driver, only: [:show, :edit, :update, :destroy]

def index
  @drivers = Driver.all.order("created_at DESC")
end

def show

end

def new
end

def create
end

def edit
end

def update
  if @driver.update(driver_params)
    redirect_to drivers_path(@driver)
  else
    render "edit"
  end
end

def destroy
  @driver.destroy
  redirect_to drivers_path
end

private

def driver_params
  params.require(:driver).permit(:name, :phone_number)
end

def find_driver
    @driver = Driver.find(params[:id])
end


end
