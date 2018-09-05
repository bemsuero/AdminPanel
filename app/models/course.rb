class Course < ApplicationRecord
  has_many :cohorts, dependent: :destroy
  has_many :students, through: :cohorts
  validates :name, :hours, :description, presence: true
end
