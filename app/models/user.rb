class User < ApplicationRecord
  has_many :robots, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
