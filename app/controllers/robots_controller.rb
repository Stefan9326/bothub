class RobotsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_robot, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:index]


  def index
    if params[:query].present?
      @robots = Robot.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @robots = Robot.all
    end

    respond_to do |format|
      format.html
      format.js { render partial: 'robots', locals: { robots: @robots } }
    end
  end

  def show
    @booking = @robot.bookings.find_by(user_id: current_user.id) if user_signed_in?
    @reviews = @robot.reviews
    @average_rating = @reviews.average(:rating)
    @review = Review.new
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
  end

  def update
    if @robot.update(robot_params)
      redirect_to @robot, notice: 'Robot was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @robot.destroy
    redirect_to robots_url, notice: 'Robot was successfully destroyed.'
  end

  def my_robots
    @robots = current_user.robots
  end

  def my_bookings
    @bookings = current_user.bookings.includes(:robot)
  end

  private

  def set_robot
    @robot = Robot.find(params[:id])
  end

  def authorize_user
    unless current_user == @robot.user
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def robot_params
    params.require(:robot).permit(:name, :description, :price, :robot_type, :availability, :image)
  end
end
