class ScootersController < ApplicationController
  # All scooters show up on the first page

  # *** LOGIN OPTION ***
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @scooters = policy_scope(Scooter)
  end

  def show
    raise
    @scooter = Scooter.find(params[:id])
    authorize @scooter
  end

  def new
    # @scooter = current_user.scooters.new
    @scooter = Scooter.new
    authorize @scooter
  end

  def create
    # @owner = User.find(params[:id])
    @scooter = Scooter.new(scooter_params)
    @scooter.user = current_user
    # @scooter.owner = @owner
    if @scooter.save
      redirect_to @scooter
    else
      render :new
    end
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
    redirect_to owner_dashboard
  end

  private

  def scooter_params
    params.require(:scooter).permit(:make, :model, :year, :location, :reg_plate, :img, :price)
  end
end
