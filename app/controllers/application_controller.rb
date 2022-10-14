class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :confirm_authentication
  
    # def authorized
    #   render json: { error: "Please log in" }, status: :unauthorized unless current_Passenger
    # end

    def current_passenger
      @current_passenger ||= Passenger.find_by_id(session[:passenger_id])
    end

    def confirm_authentication
      render json: { error: "Please log in"}, status: :unauthorized unless current_passenger
    end
end
