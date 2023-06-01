class RobotsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  protect_from_forgery except: :index

  def index
    if params[:query].present?
      @robots = Robot.where("name ILIKE ? OR robot_type ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @robots = Robot.all
    end
    respond_to do |format|
      format.html
      format.js { render partial: 'robots', locals: { robots: @robots } }
    end
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  def new
    @robot = Robot.new
  end

  def my_robots
    @robots = current_user.robots
  end

  def create
    @robot = current_user.robots.build(robot_params)
    if @robot.save
      redirect_to robot_path(@robot), notice: "Robot listing created successfully."
    else
      render :new
    end
  end

  def show
    @robot = Robot.find(params[:id])
    @booking = Booking.new
  end

  def edit
    @robot = Robot.find(params[:id])
  end

  def update
    @robot = Robot.find(params[:id])
    if @robot.update(robot_params)
      redirect_to robot_path(@robot), notice: "Robot listing updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @robot = Robot.find(params[:id])
    @robot.destroy
    redirect_to robots_path, notice: "Robot listing deleted successfully."
  end

  private

  def robot_params
    params.require(:robot).permit(:name, :description, :price, :availability, :robot_type, :image)
  end
end
