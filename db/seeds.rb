# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Clear existing data
Robot.destroy_all
User.destroy_all

puts "Terminator incoming"
# Create Robots
user1 = User.new(email: "test@test.com", password: "123456")
user1.save!
10.times do
  robot = Robot.new(
    name: Faker::Name.unique.name,
    description: Faker::Lorem.sentence,
    price: 10.00,
    availability: true,
    user_id: user1.id # Assuming you have a User model with associated data
    # User.pluck(:id).sample
  )
  robot.save!
end
puts "Created robots"
