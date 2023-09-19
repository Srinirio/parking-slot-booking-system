class CreateParkingSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_slots do |t|
      t.integer :distance_between_entry_point_1
      t.integer :distance_between_entry_point_2
      t.integer :distance_between_entry_point_3
      t.integer :distance_between_entry_point_4
      t.boolean :occupied, default: false
      t.timestamps
    end
  end
end
