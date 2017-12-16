require 'zlib'
require 'digest/md5'

class Session < ApplicationRecord
  belongs_to :user

  def initialize(attributes = {})
    super
    self.token = generateToken(self.user)
  end

  def generateToken(account)
    @username = account.username
    @password = account.password
    @timestamp = Time.now.to_s
    @base_hash = Digest::MD5.hexdigest(@username + "@" + @password + ":" + @timestamp)

    return Digest::MD5.hexdigest(@base_hash)
  end

  def self.find_token(token)
    return Session.find_by token: token
  end
end
