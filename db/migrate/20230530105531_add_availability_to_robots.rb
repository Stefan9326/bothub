class AddAvailabilityToRobots < ActiveRecord::Migration[7.0]
  def change
    change_column :robots, :availability, :boolean, default: false, null: false
  end
end
