# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

# def random_education
#   number = SecureRandom.random_number(4)
#   if number == 0
#     edu = "High School"
#   elsif number == 1
#     edu = "College"
#   elsif number == 2
#     edu = "Masters"
#   elsif number == 3
#     edu = "PHD"
#   end
#   return edu
# end


def random_education
edu = ["High School", "College", "Masters", "PHD"]
return edu.shuffle[0]
end

def random_class
random_class = ["101", "201", "301", "401"]
return random_class.shuffle[0]
end

def random_description
desc = ["The valiant fight against ", "The wild and crazy team up with ", "The battle with time and age in the first days of superheroes, with ", "Survior techniques with ", "Archery practice and the quick technique with ", "Rescuing basics and advanced techniques from the mind of ", "Surviving the internet and other selfie powered machines with "]
return desc.shuffle[0]
end
30.times do
  User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  birthdate: Faker::Date.birthday(min_age = 14, max_age = 150),
  salary: SecureRandom.random_number(150000).floor,
  education: random_education,
  password: "bemilton",
  phone: Faker::PhoneNumber.cell_phone,
  employee_id: SecureRandom.hex(6).upcase,
  admin_id: 1,
)
end

# 60.times do
#   Course.create(
#     name: Faker::Superhero.descriptor + " " + random_class,
#     hours: (1..6).to_a.shuffle[0],
#     description: random_description + Faker::Superhero.name,
#     user_id: (1..30).to_a.shuffle[0],
#   )
# end
# 1 - 180
# Student.all.destroy_all
