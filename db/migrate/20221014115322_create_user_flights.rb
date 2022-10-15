class CreateUserFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :user_flights do |t|
      t.string :method_of_transportation
      t.integer :transportation_cost
      t.string :stay
      t.integer :stay_cost
      t.string :commentary
      t.integer :user_id
      t.integer :flight_id
      t.timestamps
    end
  end
end
