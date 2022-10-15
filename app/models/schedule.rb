class Schedule < ApplicationRecord
    belongs_to :flight
    has_many :user_schedules, dependent: :destroy
    has_many :users, through: :user_schedules

    validates :name, :description, :location, :date, :start_time, :duration, :cost, presence: true
end
