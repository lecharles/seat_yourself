class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
end
