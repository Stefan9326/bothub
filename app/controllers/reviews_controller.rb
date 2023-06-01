class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @booking = Booking.find(params[:booking_id])
    @robot = @booking.robot
    @review = @robot.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @robot, notice: 'Review was successfully created.'
    else
      redirect_to @robot, alert: 'Failed to create review.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
