
class UserSchedulesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: @current_user.user_schedules.all, status: :ok
    end

    def show
        user_schedule = find_user_schedule
        render json: user_schedule, status: :ok
    end

    def create
        user_schedule = UserSchedule.create!(user_schedule_params)
        render json: user_schedule, status: :created
    end

    def destroy
        user_schedule = find_user_schedule
        user_schedule.destroy!
        head :no_content
    end

    private 

    def find_user_schedule
        UserSchedule.find(params[:id])
    end

    def user_schedule_params
        params.permit(:method_of_transportation, :transportation_cost, :commentary, :stay, :stay_cost, :flight_id, :user_id)
    end

    def 

    def render_not_found_response
        render json: { error: "UserSchedule not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
