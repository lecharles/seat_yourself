class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :reservations
  has_many :users, through: :reservations

  def load_reservations_for_restaurant
    Reservation.all.where(restaurant_id: self.id)
  end

end
