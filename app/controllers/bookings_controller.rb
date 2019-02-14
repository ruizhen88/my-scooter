class BookingsController < ApplicationController
  # *** LOGIN OPTION ***
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    # @booking = current_user.bookings.new
    @booking = Booking.new
    authorize @booking

  end

  def create
    # @owner = User.find(params[:id])
    @booking = Booking.new(booking_params)
    @user = User.find(params[:user_id])
    @scooter = Scooter.find(params[:scooter_id])
    @booking.user_id = @user
    @booking.scooter_id = @scooter
    # @booking.owner = @owner
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  # Only the owner can destroy his/her bookings at dashboard
  # To Do: find out each ids
  # def destroy
  #   @owner = User.find(params[:id])
  #   @booking = Booking.find(params[:id])
  #   @booking.destroy
  #   redirect_to owner_dashboard
  # end

  private

  def booking_params
    params.require(:booking).permit(:amount, :start_date, :end_date)
  end
end
