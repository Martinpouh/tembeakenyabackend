
class UserFlightsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: UserFlight.all, status: :ok
    end

    def show
        user_flight = find_user_flight
        render json: user_flight, status: :ok
    end

    def create
        user_flight = UserFlight.create!(user_flight_params)
        render json: user_flight, status: :created
    end

    def update
        user_flight = find_user_flight
        user_flight.update!(user_flight_params)
        render json: user_flight, status: :ok
    end

    def destroy
        user_flight = find_user_flight
        user_flight.destroy!
        head :no_content
    end

    private 

    def find_user_flight
        UserFlight.find(params[:id])
    end

    def user_flight_params
        params.permit(:method_of_transportation, :transportation_cost, :commentary, :stay, :stay_cost, :flight_id, :user_id)
    end

    def 

    def render_not_found_response
        render json: { error: "UserFlight not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
