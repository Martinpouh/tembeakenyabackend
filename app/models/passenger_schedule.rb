class PassengerSchedule < ApplicationRecord
    belongs_to :passenger 
    belongs_to :schedule
end
