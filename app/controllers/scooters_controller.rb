class ScootersController < ApplicationController
  # All scooters show up on the first page

  # *** LOGIN OPTION ***
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @scooters = policy_scope(Scooter).search_by_everything(params[:query])
    else
      @scooters = policy_scope(Scooter)
    end
    # return @scooters.where.not(latitude: nil, longitude: nil)
    @markers = @scooters.map do |scooter|
      {
        lng: scooter.longitude,
        lat: scooter.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { scooter: scooter }),
      }
    end
  end

  def show
    @scooter = Scooter.find(params[:id])
    authorize @scooter
  end

  def new
    # @scooter = current_user.scooters.new
    @scooter = Scooter.new
    @user = current_user
    authorize @scooter
  end

  def create
    # @owner = User.find(params[:id])
    @scooter = Scooter.new(scooter_params)
    @user = current_user
    @scooter.user = @user
    authorize @scooter


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
