class BountiesController < ApplicationController
  before_action :require_user
  before_action :set_bounty, only: %i[ show edit update destroy ]

  def index
    @bounties = Bounty.all
  end

  def new
    @bounty = Bounty.new
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

    def set_bounty
      @bounty = Bounty.find(params.expect(:id))
    end

    def bounty_params
      params.expect(bounty: [ :title, :amount ])
    end
end
