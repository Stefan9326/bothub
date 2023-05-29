class Booking < ApplicationRecord
  belongs_to :robot
  belongs_to :user
end
