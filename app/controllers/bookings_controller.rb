class BookingsController < ApplicationController
  before_action :set_robot, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @robot = Robot.find(params[:robot_id])
    start_date_string, end_date_string = params[:booking][:start_date].split(" to ")
    start_date = Date.parse(start_date_string)
    end_date = Date.parse(end_date_string)
    @days_booked = (end_date - start_date).to_i
    @total_price = @days_booked * @robot.price
    @booking = Booking.new(
      start_date: start_date,
      end_date: end_date,
      robot_id: params[:robot_id],
      user_id: current_user.id
    )
    @booking.robot = @robot
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking created successfully.'
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @robot = @booking.robot if @booking.present?
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_robot
    @robot = Robot.find(params[:robot_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
