class SchedulesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Schedule.all, status: :ok
    end

    def show
        schedule = find_schedule
        render json: schedule, status: :ok
    end

    def create
        schedule = Schedule.create!(schedule_params)
        passenger_schedule = PassengerSchedule.create!(
            passenger_id: @current_passenger.id,
            schedule_id: schedule.id
        )
        render json: schedule, status: :created
    end

    def update
        schedule = find_schedule
        schedule.update!(schedule_params)
        render json: schedule, status: :ok
    end

    def destroy
        schedule = find_schedule
        schedule.destroy!
        head :no_content
    end

    private 

    def find_schedule
        Schedule.find(params[:id])
    end

    def schedule_params
        params.permit(:name, :description, :location, :date, :start_time, :duration, :cost, :flight_id)
    end

    def 

    def render_not_found_response
        render json: { error: "Schedule not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
