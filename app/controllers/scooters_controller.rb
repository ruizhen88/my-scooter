class ScootersController < ApplicationController
  # All scooters show up on the first page

  # *** LOGIN OPTION ***
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @scooters = Scooter.all
  end

  def show
    @scooter = Scooter.find(params[:id])
  end

  def new
    @scooter = Scooter.new
  end

  def create
    @owner = User.find(params[:id])
    @scooter = Scooter.new(scooter_params)
    @scooter.owner = @owner
  end

  def edit
  end

  def update
  end

  # Only the owner can destroy his/her scooters at dashboard
  # To Do: find out each ids
  def destroy
    @owner = User.find(params[:id])
    @scooter = Scooter.find(params[:id])
    @scooter.destroy
    redirect_to owner_dashboarda
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
