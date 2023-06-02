class Robot < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :image
  has_many :reviews

  ROBOT_TYPES = [
    'Cleaner',
    'Personal Trainer',
    'Home Health Care',
    'Security',
    'Tutor',
    'Pet Care',
    'Handyman',
    'Chef',
    'Gardener',
    'Personal Assistant'
  ]

  validates :robot_type, presence: true

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def average_rating
    if reviews.any?
      reviews.average(:rating).to_f
    else
      0.0
    end
  end
end
