class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_number, presence:true



  def total_cost
    total_cost = 0
    passenger_trips = self.trips

    passenger_trips.each do |trip|
      total_cost += trip.cost
    end

    return "$ #{sprintf("%.2f",(total_cost / 100.0))}"
  end

end
