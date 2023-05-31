class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @robot = Robot.find(params[:robot_id])
    @booking = Booking.new(booking_params)
    @booking.robot = @robot
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking created successfully.'
    else
      render robot_path(@robot)
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @robot = @booking.robot
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking deleted successfully.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
