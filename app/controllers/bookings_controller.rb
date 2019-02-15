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
    @scooter = Scooter.find(params[:scooter_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = "Pending"
    @booking.scooter = Scooter.find(params[:scooter_id])
    @booking.amount = amount_calculation(@booking)
    authorize @booking

    if @booking.save
      redirect_to scooter_booking_path(@booking.scooter, @booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def amount_calculation(booking)
    return booking.scooter.price * (booking.end_date - booking.start_date).to_i
  end
end
