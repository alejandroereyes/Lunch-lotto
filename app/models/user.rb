class User < ActiveRecord::Base
  has_secure_password
  has_many :foods
  has_many :matches
  has_many :messages
  validates :name, presence: { message: "Hi, looks like you forgot to add your name." }
  validates :email, presence: { message: "Hi, looks like you forgot to add an email" }
  validates :network_cirle, presence: { message: "Hi, looks you forgot to select a cirle" }
end
