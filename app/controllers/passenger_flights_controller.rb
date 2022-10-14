
class PassengerFlightsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: PassengerFlight.all, status: :ok
    end

    def show
        passenger_flight = find_passenger_flight
        render json: passenger_flight, status: :ok
    end

    def create
        passenger_flight = PassengerFlight.create!(passenger_flight_params)
        render json: passenger_flight, status: :created
    end

    def update
        passenger_flight = find_passenger_flight
        passenger_flight.update!(passenger_flight_params)
        render json: passenger_flight, status: :ok
    end

    def destroy
        passenger_flight = find_passenger_flight
        passenger_flight.destroy!
        head :no_content
    end

    private 

    def find_passenger_flight
        PassengerFlight.find(params[:id])
    end

    def passenger_flight_params
        params.permit(:method_of_transportation, :transportation_cost, :commentary, :stay, :stay_cost, :flight_id, :passenger_id)
    end

    def 

    def render_not_found_response
        render json: { error: "PassengerFlight not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
