class UsersController < ApplicationController
  before_action :require_user, :load_and_authorize_user,
    only: %i[ edit update ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:current_user_id] = @user.id
        format.html { redirect_to bounties_path, notice: "Welcome to Bounty Hunter!" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def load_and_authorize_user
    @user = User.find(params.expect(:id))
    authorize!(@user)
  end

  def user_params
    params.expect(user: [ :email, :password, :postal_code, :first_name, :last_name ])
  end
end
