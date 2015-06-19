class User < ActiveRecord::Base
  has_secure_password
  has_many :foods
  has_many :matches
  has_many :messages
end
