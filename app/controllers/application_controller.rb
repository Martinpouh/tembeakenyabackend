class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :confirm_authentication
  

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def confirm_authentication
      render json: { error: "Please log in"}, status: :unauthorized unless current_user
    end
end
