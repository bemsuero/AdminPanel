class Course < ApplicationRecord
  belongs_to :user
  validates :name, :hours, :description, presence: true
end
