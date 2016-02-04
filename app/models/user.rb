class User < ActiveRecord::Base
  has_secure_password
  has_many :reservations
  has_many :restaurants, through: :reservations
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, confirmation: true
end
