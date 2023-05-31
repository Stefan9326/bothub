# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
default_robot_image = Rails.root.join('app', 'assets', 'images', 'p0uy4lv_Professional_Robot_Companion_to_let_online_natural_colo_026f3ec9-e89a-4c2b-a85e-793775680587.png')
robot_types = [
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

# Create Users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

10.times do
  robot = Robot.new(
    name: Faker::Name.name,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price,
    availability: [true, false].sample,
    robot_type: robot_types.sample,
    user_id: User.pluck(:id).sample
  )

  if robot.image.blank?
    robot.image.attach(io: File.open(default_robot_image), filename: 'default_robot_image.png', content_type: 'image/png')
  end

  robot.save!
end
