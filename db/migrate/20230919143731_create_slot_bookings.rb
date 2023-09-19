class CreateSlotBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :slot_bookings do |t|
      t.integer :entrance_id
      t.string :vehicle_registration_number
      t.datetime :entry_time
      t.integer :parking_slot_id

      t.timestamps
    end
  end
end
