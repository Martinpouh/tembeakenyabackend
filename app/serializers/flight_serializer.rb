class FlightSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :creator, :location, :image, :budget, :user_flight, :user_schedules

  has_many :schedules
  has_many :users

  def user_flight
    current_user.user_flights.find_by(flight_id: object.id)
  end

  def user_schedules
    current_user.user_schedules.filter{|user_schedule| user_schedule.schedule.flight_id == object.id}
  end
end
