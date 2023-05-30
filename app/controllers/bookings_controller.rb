class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to bookings_path, notice: 'Booking created successfully.'
    else
      render :index
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking deleted successfully.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :robot_id, :user_id)
  end
end
