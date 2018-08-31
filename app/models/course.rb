class Course < ApplicationRecord
  has_many :cohorts
  validates :name, :hours, :description, presence: true
end
