require "bcrypt"
class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  has_many :sessions, dependent: :destroy

  def self.find_user(login)
    return User.find_by username: login
  end
  def self.find_id(id)
    return User.find_by id: id
  end

  include BCrypt

  def password
    @password ||= Password.new(self.passhash)
  end
  def password=(new_password)
    @password = Password.create(new_password)
    self.passhash = @password
  end
end
