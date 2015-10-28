class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name, :email, :password
  validates :name, length: {maximum: 50}
  validates :email, length: {maximum: 255}, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }
end
