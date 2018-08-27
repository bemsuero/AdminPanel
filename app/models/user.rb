class User < ApplicationRecord
has_many :courses
  def full_name
    self.first_name + " " + self.last_name
  end
end
