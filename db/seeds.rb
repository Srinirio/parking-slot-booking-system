# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

EntryPoint.create(name: 'Entry Point 1')
EntryPoint.create(name: 'Entry Point 2')
EntryPoint.create(name: 'Entry Point 3')
EntryPoint.create(name: 'Entry Point 4')

# Create parking slots with distances
(1..5).each do
  ParkingSlot.create(
    distance_between_entry_point_1: rand(1..10),
    distance_between_entry_point_2: rand(1..10),
    distance_between_entry_point_3: rand(1..10),
    distance_between_entry_point_4: rand(1..10)
  )
end
