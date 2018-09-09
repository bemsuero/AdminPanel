class Student < ApplicationRecord
  belongs_to :cohort
  has_one_attached :photo
  validates :first_name, :last_name, :birthdate, :education, :student_id, presence: true
  validates_date :birthdate, on_or_before: Time.now.year - 14
  validates_date :birthdate, on_or_after: Time.now.year - 150
  VALID_PHONE_REGEX = /\d/m
  validates :phone, presence: true, length: {minimum: 10}, format: { with: VALID_PHONE_REGEX }

  def full_name
    self.first_name + " " + self.last_name
  end

  def generate_student_id
    self.student_id = SecureRandom.hex(4).upcase
  end


end
