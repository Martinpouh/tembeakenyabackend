class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :name 
      t.string :description
      t.string :creator
      t.string :location
      t.string :start_date
      t.string :end_date
      t.string :image
      t.integer :budget
      t.timestamps
    end
  end
end
