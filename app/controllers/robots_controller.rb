class RobotsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_robot, only: [:show, :edit, :update, :destroy]

  def index
    @robots = Robot.includes(:reviews)
  end

  def show
    @booking = @robot.bookings.find_by(user_id: current_user.id) if user_signed_in?
    @reviews = @robot.reviews
    @average_rating = @robot.average_rating
    @review = Review.new # Add this line to instantiate a new review object for the form
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = current_user.robots.build(robot_params)

    if @robot.save
      redirect_to @robot, notice: 'Robot was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @robot
  end

  def update
    authorize @robot

    if @robot.update(robot_params)
      redirect_to @robot, notice: 'Robot was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @robot
    @robot.destroy
    redirect_to robots_url, notice: 'Robot was successfully destroyed.'
  end

  def my_bookings
    @bookings = current_user.bookings.includes(:robot)
  end

  private

  def set_robot
    @robot = Robot.find(params[:id])
  end

  def robot_params
    params.require(:robot).permit(:name, :description, :price, :robot_type, :availability, :image)
  end
end
