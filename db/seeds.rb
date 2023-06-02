# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
default_robot_image_paths = (1..5).map { |n| Rails.root.join("app", "assets", "images", "#{n}.png") }
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
    random_image_path = default_robot_image_paths.sample
    robot.image.attach(io: File.open(random_image_path), filename: File.basename(random_image_path), content_type: 'image/png')
  end

  robot.save!

  # Add fake ratings for the robot
  rand(1..5).times do
    Review.create!(
      rating: rand(1..5),
      comment: Faker::Lorem.paragraph,
      user_id: User.pluck(:id).sample,
      robot_id: robot.id
    )
  end
end
