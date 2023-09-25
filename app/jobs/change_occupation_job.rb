class ChangeOccupationJob < ApplicationJob
  queue_as :default

  def perform(parking_slot)


    parking_slot.update(occupied: false)

    p "hello- #{parking_slot.id}"
  end

end
