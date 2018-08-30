class Course < ApplicationRecord
  has_many :students, dependent: :destroy
  validates :name, :hours, :description, presence: true
end
