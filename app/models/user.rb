class User < ApplicationRecord
has_many :courses, dependent: :destroy
has_many :cohorts, through: :courses
has_many :students, through: :cohorts
before_save { self.email = email.downcase }
has_secure_password
validates :password, presence: true, length: {minimum: 8, maximum: 32}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
validates_date :birthdate, on_or_before: Time.now.year - 14
validates_date :birthdate, on_or_after: Time.now.year - 150

  def create_employee_id
    self.employee_id = SecureRandom.hex(6).upcase
  end

  def full_name
    self.first_name + " " + self.last_name
  end
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(attribute, token)
  digest = send("#{attribute}_digest")
  return false if digest.nil?
  BCrypt:Password.new(digest).is_password?(token)
  end


end
