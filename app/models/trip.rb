class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

validates :driver_id, numericality: { greater_than: 0 }
validates :passenger_id,  numericality: { greater_than: 0 }
validates :cost, presence: true, numericality: { only_integer: true, greater_than: 100 }
validates :rating, presence: true

end

# does this need any defs?
