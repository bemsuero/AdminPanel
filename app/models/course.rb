class Course < ApplicationRecord
  has_many :students
  validates :name, :hours, :description, presence: true
end
