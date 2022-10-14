class PassengersController < ApplicationController
    skip_before_action :confirm_authentication

    def show
        if current_passenger
            render json: @current_passenger, status: :ok
        else 
            render json: { error: "No active session" }, status: :unauthorized
        end
    end

    def create
        passenger = Passenger.new(passenger_params)
        if passenger.save
            session[:passenger_id] = passenger.id
            render json: passenger, status: :created
        else
            render json: passenger.errors, status: :unprocessable_entity
        end
    end

    private 

    # def find_passenger
    #     Passenger.find(params[:id])
    # end

    def passenger_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
