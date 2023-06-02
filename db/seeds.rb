# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Users
# User.create!(email: 'soltanpo.p@gmail.com', password: '123456')
# User.create!(email: 'dorin.calin@gmail.com', password: '123456')
# User.create!(email: 'rory.ble13@gmail.com', password: '123456')
# User.create!(email: 'stefshbrook@gmail.com', password: '123456')
password = '123456'


10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: password
  )
end

robot1 = Robot.create!(
  name: 'Clean-O-Bot',
  description: "Your friendly neighborhood dust-buster, tackling dirt and grime so you don't have to! No speck of dust is too small, no stain too stubborn.",
  price: 100.00,
  availability: true,
  robot_type: "Cleaner",
  user: User.first
)

robot2 = Robot.create!(
  name: "Plant Parenthood",
  description: "A botanist best friend, ensuring your green friends have all the water, sunlight, and nutrients they need. Your plants will be greener with envy.",
  price: 90.00,
  availability: true,
  robot_type: "Gardening",
  user: User.first
)

robot3 = Robot.create!(
  name: "PAL",
  description: "Need an extra hand or three? PAL Bots here to juggle your schedule, manage your tasks, and remember your Aunts birthday so you dont have to.",
  price: 130.00,
  availability: true,
  robot_type: "Personal Assistant",
  user: User.first
)

robot4 = Robot.create!(
  name: 'Guardian-Bot',
  description: "Ever vigilant, ever watchful, this security bot never sleeps (because it can't!). Ensuring your home is as safe as a fortress, without the medieval decor.",
  price: 120.00,
  availability: true,
  robot_type: 'Security',
  user: User.first
)

robot5 = Robot.create!(
  name: 'Dr. RoboCare',
  description: "Bringing health to your doorstep, literally. This bot can dispense medication, monitor vitals, and even provide a comforting mechanical pat on the back.",
  price: 110.00,
  availability: true,
  robot_type: 'Medical Assistance',
  user: User.first
)

robot6 = Robot.create!(
  name: 'Chef Automate',
  description: "From flambé to sushi, this robot's got you covered. It doesn't even mind pineapple on pizza. Judgement-free cooking at its finest",
  price: 150.00,
  availability: true,
  robot_type: 'Cooking',
  user: User.first
)

robot7 = Robot.create!(
  name: 'Nanny-Bot',
  description: "Your children's new best friend. Can read bedtime stories, help with homework, and won't ever tire of playing hide and seek",
  price: 100.00,
  availability: true,
  robot_type: 'Childcare',
  user: User.first
)

robot8 = Robot.create!(
  name: 'Tutor-Bot 3000',
  description: "Master of all academic subjects, able to explain Pythagorean theorem or Shakespeare's sonnets with equal ease. Making homework a 'byte' easier.",
  price: 140.00,
  availability: true,
  robot_type: 'Tutoring',
  user: User.first
)

robot9 = Robot.create!(
  name: 'Furry Friend Sitter',
  description: "The ultimate pet pal, always ready for a walk or a game of fetch. Can open cans of food and doesn't mind changing litter boxes. Purrfect, isn't it?",
  price: 100.00,
  availability: true,
  robot_type: 'Pet Care',
  user: User.first
)

robot10 = Robot.create!(
  name: 'Handy-Bot',
  description: "Why DIY when you have Handy-Bot? It can paint walls, fix leaking faucets, and even assemble that tricky flat-pack furniture.",
  price: 110.00,
  availability: true,
  robot_type: 'Personal Trainer',
  user: User.first
)

# Attach image to the robots
robot1.image.attach(io: File.open('app/assets/images/image1.png'), filename: 'image1.png', content_type: 'image/png')
robot2.image.attach(io: File.open('app/assets/images/image2.png'), filename: 'image2.png', content_type: 'image/png')
robot3.image.attach(io: File.open('app/assets/images/image3.png'), filename: 'image3.png', content_type: 'image/png')
robot4.image.attach(io: File.open('app/assets/images/image4.png'), filename: 'image4.png', content_type: 'image/png')
robot5.image.attach(io: File.open('app/assets/images/image5.png'), filename: 'image5.png', content_type: 'image/png')
robot6.image.attach(io: File.open('app/assets/images/image6.png'), filename: 'image6.png', content_type: 'image/png')
robot7.image.attach(io: File.open('app/assets/images/image7.png'), filename: 'image7.png', content_type: 'image/png')
robot8.image.attach(io: File.open('app/assets/images/image8.png'), filename: 'image8.png', content_type: 'image/png')
robot9.image.attach(io: File.open('app/assets/images/image9.png'), filename: 'image9.png', content_type: 'image/png')
robot10.image.attach(io: File.open('app/assets/images/image10.png'), filename: 'image10.png', content_type: 'image/png')

# Save robots
robot1.save!
robot2.save!
robot3.save!
robot4.save!
robot5.save!
robot6.save!
robot7.save!
robot8.save!
robot9.save!
robot10.save!
