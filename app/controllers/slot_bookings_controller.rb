class SlotBookingsController < ApplicationController
  before_action :set_entry
  def new
    @booking = @entry_point.slot_bookings.new
  end

  def create
    @booking = @entry_point.slot_bookings.new(slot_params)
    @booking.checkin_date = Date.today

    @booking.entry_time = Time.now

    slot = ParkingSlot.where(occupied: false ).order("distance_between_entry_point_#{@booking.entry_point_id} ASC").first
    if slot
      @booking.parking_slot_id = slot.id

      if @booking.save
      slot.update(occupied: true )
      ChangeOccupationJob.set(wait_until: @booking.checkout_time).perform_later(slot)
      flash[:success] = "Slot booked successfully. Your slot number is #{slot.id}."
      redirect_to new_entry_point_slot_booking_path(@entry_point)
      else
        flash[:error] = "You entered invalid input"
        redirect_to new_entry_point_slot_booking_path(@entry_point)
      end
    else
      flash[:error] = "Sorry, no slots are available at the selected entrance."
      redirect_to new_entry_point_slot_booking_path(@entry_point)
    end
  end



  private

  def set_entry
    @entry_point = EntryPoint.find(params[:entry_point_id])
  end

  def slot_params
    params.require(:slot_booking).permit(:entry_point_id,:vehicle_reg_num,:entry_time,:checkout_time)
  end

end
