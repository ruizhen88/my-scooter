class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review)
  end

  def new
    @review = Review.new
    @user = User.find(params[:user_id])
    @booking = Booking.find(params[:booking_id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    authorize @review

    if @review.save
      redirect_to user_bookings_path(current_user)
    else
      render :new
    end
    # need to validate if booking period has ended
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
