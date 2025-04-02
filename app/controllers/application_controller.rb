class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :current_user

  private

    def require_user
      return if current_user
      redirect_to login_path, alert: "You must be logged in"
    end

    def current_user
      @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
    end
end
