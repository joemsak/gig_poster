class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params.expect(:email))

    if user.authenticate(params.expect(:password))
      cookies.signed[:user_id] = user.id
      redirect_to root_path
    else
      render :new, notice: "Login failed"
    end
  end
end
