class BookingsController < ApplicationController
  before_action :set_robot, only: [:new, :create]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.robot = @robot
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking created successfully.'
    else
      render :new
    end
  end

  def show
    @robot = @booking.robot if @booking.present?
  end

  def edit
  end

  def update
    # @booking.save!
    # redirect_to booking_path(@booking)
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: 'Booking updated successfully.'
    else
      render :edit, status: :unprocessability
    end
  end

  def destroy
    @booking.destroy
    redirect_to my_bookings_path, status: :see_other
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
