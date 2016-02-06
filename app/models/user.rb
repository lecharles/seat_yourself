class User < ActiveRecord::Base
  has_secure_password
  has_many :reservations
  has_many :restaurants, through: :reservations
  has_many :owned_restaurants, class_name: 'Restaurant', foreign_key: "owner_id"
  validates :email, :first_name, :last_name, presence: true
  validates :password, presence: true
  validates :password_confirmation, confirmation: true
end
