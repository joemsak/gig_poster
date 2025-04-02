class ApplicationController < ActionController::Base
  rescue_from "ActiveRecord::RecordNotFound" do
    redirect_to root_path, alert: "We couldn't find that page."
  end

  helper_method :current_user, :permission

  private

  def require_user
    return if current_user
    redirect_to login_path, alert: "You must be logged in"
  end

  def authorize!(resource)
    return if permission(resource).allowed?(action_name:)
    redirect_to root_path, alert: "You are not allowed to do that."
  end

  def permission(resource)
    @permission ||= Permission.for(resource:, current_user:)
  end

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end
end
