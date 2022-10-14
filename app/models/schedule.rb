class Schedule < ApplicationRecord
    belongs_to :flight
    has_many :passenger_schedules, dependent: :destroy
    has_many :passengers, through: :passenger_schedules

    validates :name, :description, :location, :date, :start_time, :duration, :cost, presence: true
end
