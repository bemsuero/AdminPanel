class Student < ApplicationRecord
  has_many :courses
  has_many :users, through: :courses
  validates :first_name, :last_name, :birthdate, :education, presence: true
end
