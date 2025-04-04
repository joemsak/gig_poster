class BountiesController < ApplicationController
  before_action :require_user
  before_action :load_and_authorize_bounty, only: %i[ edit update destroy ]

  def index
    @bounties = Bounty.all
  end

  def show
    @bounty = Bounty.find(params.expect(:id))
  end

  def new
    @bounty = current_user.bounties.build
  end

  def create
    @bounty = current_user.bounties.build(bounty_params)

    respond_to do |format|
      if @bounty.save
        format.html { redirect_to @bounty, notice: "Bounty was successfully created." }
        format.json { render :show, status: :created, location: @bounty }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bounty.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bounty.update(bounty_params)
        format.html { redirect_to @bounty, notice: "Bounty was successfully updated." }
        format.json { render :show, status: :ok, location: @bounty }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bounty.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bounty.destroy!

    respond_to do |format|
      format.html { redirect_to bounties_path, status: :see_other, notice: "Bounty was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def load_and_authorize_bounty
    @bounty = current_user.bounties.find(params.expect(:id))
    authorize!(@bounty)
  end

  def bounty_params
    params.expect(bounty: [ :title, :amount, :postal_code ])
  end
end
