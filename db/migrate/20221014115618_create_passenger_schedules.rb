class CreatePassengerSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :passenger_schedules do |t|
      t.integer :passenger_id
      t.integer :schedule_id
      t.timestamps
    end
  end
end
