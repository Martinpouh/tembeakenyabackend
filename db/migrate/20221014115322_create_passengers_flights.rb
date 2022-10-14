class CreatePassengersFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers_flights do |t|
      t.string :method_of_transportation
      t.integer :transportation_cost
      t.string :accommodation_description
      t.integer :accommodation_cost
      t.string :commentary
      t.integer :passenger_id
      t.integer :flight_id
      t.timestamps
    end
  end
end
