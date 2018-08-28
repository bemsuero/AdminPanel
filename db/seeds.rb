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

30.times do
  Student.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  education: random_education,
  birthdate: Faker::Date.birthday(min_age = 14, max_age = 150)
)
end

# Student.all.destroy_all
