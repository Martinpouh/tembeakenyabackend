class FlightsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Flight.all, status: :ok
    end

    def show
        flight = find_flight
        render json: flight, status: :ok
    end

    def create
        flight = Flight.new(flight_params)
        flight.creator = current_user.first_name
        flight.save!
        user_flight = UserFlight.create!(
            user_id: @current_user.id,
            flight_id: flight.id
        )
        render json: flight, status: :created
    end

    def update
        flight = find_flight
        flight.update!(flight_params)
        render json: flight, status: :ok
    end

    def destroy
        flight = find_flight
        flight.destroy!
        head :no_content
    end

    def flightsbooked
        render json: @current_user.flights.all
    end

    private 

    def find_flight
        Flight.find(params[:id])
    end

    def flight_params
        params.permit(:name, :description, :location, :start_date, :end_date, :image, :budget)
    end

    def 

    def render_not_found_response
        render json: { error: "Flight not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
