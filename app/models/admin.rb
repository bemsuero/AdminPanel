class Admin < ApplicationRecord
  has_many :users
  has_one_attached :photo
  #, default_url: "/images/:style/missing.png" for default photos, going to check if my first thing works though
  before_save { self.email = email.downcase }
  has_secure_password
  validates :password, presence: true, length: {minimum: 8, maximum: 32}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

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
