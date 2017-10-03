class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

# validates :driver_id, numericality: { greater_than: 0 }
# validates :passenger_id,  numericality: { greater_than: 0 }
validates :cost, presence: true, numericality: { greater_than: 100 }
validates :rating, presence: true,numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }

end

# does this need any defs?
