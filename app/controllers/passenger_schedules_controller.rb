
class PassengerSchedulesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: @current_passenger.passenger_schedules.all, status: :ok
    end

    def show
        passenger_schedule = find_passenger_schedule
        render json: passenger_schedule, status: :ok
    end

    def create
        passenger_schedule = PassengerSchedule.create!(passenger_schedule_params)
        render json: passenger_schedule, status: :created
    end

    def destroy
        passenger_schedule = find_passenger_schedule
        passenger_schedule.destroy!
        head :no_content
    end

    private 

    def find_passenger_schedule
        PassengerSchedule.find(params[:id])
    end

    def passenger_schedule_params
        params.permit(:method_of_transportation, :transportation_cost, :commentary, :stay, :stay_cost, :flight_id, :passenger_id)
    end

    def 

    def render_not_found_response
        render json: { error: "PassengerSchedule not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
