class SessionsController < ApplicationController
  rescue_from "ActionController::ParameterMissing" do
    redirect_to login_path, alert: "Incorrect email and/or password"
  end

  def create
    user = User.find_by(email: params.expect(:email))

    if user.authenticate(params.expect(:password))
      session[:current_user_id] = user.id
      redirect_to bounties_path, notice: "Welcome back"
    else
      render :new, alert: "Incorrect email and/or password"
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, notice: "You logged out."
  end
end
