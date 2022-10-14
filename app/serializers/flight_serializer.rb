class FlightSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :creator, :location, :image, :budget, :passenger_flight, :passenger_schedules

  has_many :schedules
  has_many :passengers

  def passenger_flight
    current_passenger.passenger_flights.find_by(flight_id: object.id)
  end

  def passenger_schedules
    current_passenger.passenger_schedules.filter{|passenger_schedule| passenger_schedule.schedule.flight_id == object.id}
  end
end
