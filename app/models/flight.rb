class Flight < ApplicationRecord
    has_many :schedules, dependent: :destroy
    has_many :user_flights, dependent: :destroy
    has_many :users, through: :user_flights

    validates :name, :description, :creator, :location, :start_date, :end_date, :image, :budget, presence: true
end
