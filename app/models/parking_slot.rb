class ParkingSlot < ApplicationRecord
  has_many :slot_bookings
end
