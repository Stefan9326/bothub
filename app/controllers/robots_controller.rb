class RobotsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @robots = Robot.all
  end

  def new
    @robot = Robot.new
  end

  def my_robots
    @robots = Robot.where(user_id: current_user.id)
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
    params.require(:robot).permit(:name, :description, :price, :availability)
  end
end
