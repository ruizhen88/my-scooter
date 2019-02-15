class ReviewsController < ApplicationController

  def index
    @reviews = policy_scope(Review)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
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
end
