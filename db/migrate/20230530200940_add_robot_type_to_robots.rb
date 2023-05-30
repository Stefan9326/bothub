class AddRobotTypeToRobots < ActiveRecord::Migration[7.0]
  def change
    add_column :robots, :robot_type, :string
  end
end
