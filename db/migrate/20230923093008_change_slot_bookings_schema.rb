class ChangeSlotBookingsSchema < ActiveRecord::Migration[7.0]
  def change
    change_table :slot_bookings do |t|
      t.rename :entrance_id, :entry_point_id
      t.rename :vehicle_registration_number, :vehicle_reg_num
      add_column :slot_bookings, :checkout_time, :datetime
      add_column :slot_bookings, :checkin_date, :date
    end
  end
end
