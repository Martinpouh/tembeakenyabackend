class CreateUserSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :user_schedules do |t|
      t.integer :user_id
      t.integer :schedule_id
      t.timestamps
    end
  end
end
