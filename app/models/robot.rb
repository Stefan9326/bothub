class Robot < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  ROBOT_TYPES = [
    'Cleaner Robot',
    'Personal Trainer Robot',
    'Home Health Care Robot',
    'Security Robot',
    'Tutor Robot',
    'Pet Care Robot',
    'Handyman Robot',
    'Chef Robot',
    'Gardener Robot',
    'Personal Assistant Robot'
  ]

  validates :robot_type, inclusion: { in: ROBOT_TYPES }

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
