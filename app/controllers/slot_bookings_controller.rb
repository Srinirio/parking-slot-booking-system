class SlotBookingsController < ApplicationController
  def new
    @booking = SlotBooking.new
  end

  def create
    entry_point_id = params[:slot_booking][:entrance_id]
    vehicle_registration_number = params[:slot_booking][:vehicle_registration_number]
    # Find the nearest available slot based on entry point and distance calculation
    nearest_slot = ParkingSlot.where(occupied: false ).order("distance_between_entry_point_#{entry_point_id} ASC").first

    if nearest_slot
      slot_booking = SlotBooking.new(
        entrance_id: entry_point_id,
        vehicle_registration_number: vehicle_registration_number,
        entry_time: Time.now,
        parking_slot_id: nearest_slot.id
      )

      if slot_booking.save
        # Mark the slot as occupied
        nearest_slot.update(occupied: true )

        # Redirect to a success page or show a success message
        flash[:success] = "Slot booked successfully. Your slot number is #{nearest_slot.id}."
        redirect_to root_path,notice: "Slot booked successfully. Your slot number is #{nearest_slot.id}."
      else
        # Handle validation errors
        flash[:error] = "Validation errors: #{slot_booking.errors.full_messages.join(', ')}"
        redirect_to root_path
      end
    else
      # No available slots
      flash[:error] = "Sorry, no slots are available at the selected entrance."
      redirect_to root_path
    end
  end

end
