class SessionsController < ApplicationController
    skip_before_action :confirm_authentication, only: [:create]

    def create
      passenger = Passenger.find_by(email: params[:email])
      if passenger&.authenticate(params[:password])
        session[:passenger_id] = passenger.id
        render json: passenger, status: :created
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end

    # def destroy
    #     if current_passenger
    #       session.delete :passenger_id
    #     else
    #       render json: { error: 'no active session'}, status: :unprocessable_entity
    #     end
    # end

    def destroy
        session.delete :passenger_id
        head :no_content
    end

end