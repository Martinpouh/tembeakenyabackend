class Passenger < ApplicationRecord
    has_secure_password

    has_many :passenger_flights
    has_many :flights, through: :passenger_flights
    has_many :passenger_schedules
    has_many :schedules, through: :passenger_schedules

    validates :first_name, :last_name, :password_digest, presence: true
    validates :email, uniqueness: true
end
