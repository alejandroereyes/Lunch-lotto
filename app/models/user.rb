class User < ActiveRecord::Base
  has_secure_password
  has_many :foods, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :name, presence: { message: "Hi, looks like you forgot to add your name." }
  validates :email, presence: { message: "Hi, looks like you forgot to add an email" }
  validates :network_cirle, presence: { message: "Hi, looks you forgot to select a cirle" }
end
