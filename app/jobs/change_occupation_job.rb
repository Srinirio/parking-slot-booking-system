class ChangeOccupationJob < ApplicationJob
  queue_as :default

  def perform(parking_slot)
    if parking_slot.update(occupied: false)
      p "Successfully updated parking_slot #{parking_slot.id}"
    else
      p "Failed to update parking_slot #{parking_slot.id}: #{parking_slot.errors.full_messages.join(', ')}"
    end
  end
end
