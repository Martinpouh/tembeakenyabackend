class Flight < ApplicationRecord
    has_many :schedules, dependent: :destroy
    has_many :passenger_flights, dependent: :destroy
    has_many :passengers, through: :passenger_flights

    validates :name, :description, :creator, :location, :start_date, :end_date, :image, :budget, presence: true
end
