class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :description
      t.string :date
      t.string :start_time
      t.integer :duration
      t.integer :cost
      t.integer :flight_id
      t.timestamps
    end
  end
end
