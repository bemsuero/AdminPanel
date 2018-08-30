class Student < ApplicationRecord
  belongs_to :course
  validates :first_name, :last_name, :birthdate, :education, :student_id, presence: true

  def full_name
    self.first_name + " " + self.last_name
  end

  def generate_student_id
    self.student_id = SecureRandom.hex(4).upcase
  end


end
