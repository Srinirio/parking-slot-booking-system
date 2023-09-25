class SlotBooking < ApplicationRecord
  belongs_to :entry_point
  belongs_to :parking_slot
  validates :vehicle_reg_num, presence: true
  validates :entry_time, presence: true
  validates :checkout_time, presence: true

  validate :checkout_time_must_be_in_future

  def checkout_time_must_be_in_future
    if checkout_time.present? && checkout_time <= Time.now
      errors.add(:checkout_time, "must be in the future")
    end
  end
end
