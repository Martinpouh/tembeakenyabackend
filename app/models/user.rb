class User < ApplicationRecord
    has_secure_password

    has_many :user_flights
    has_many :flights, through: :user_flights
    has_many :user_schedules
    has_many :schedules, through: :user_schedules

    validates :first_name, :last_name, :password_digest, presence: true
    validates :email, uniqueness: true
end
