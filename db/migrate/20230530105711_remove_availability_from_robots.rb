class RemoveAvailabilityFromRobots < ActiveRecord::Migration[7.0]
  def change
    remove_column :robots, :availability, :boolean
  end
end
