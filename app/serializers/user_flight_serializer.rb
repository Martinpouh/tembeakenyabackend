class UserFlightSerializer < ActiveModel::Serializer
  attributes :id, :method_of_transportation, :transportation_cost, :commentary, :stay, :stay_cost, :flight_id, :user_id
end
