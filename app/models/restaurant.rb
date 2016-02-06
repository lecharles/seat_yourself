class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :reservations
  has_many :users, through: :reservations

  def total_diners_at_time(time)
    @total_diners = 0
      load_reservations_for_restaurant.where(time: self.time).each do |res|
        @total_diners += res.party_size
      end
    @total_diners
  end

  # Not currently using this method.
  def available?
    capacity > total_diners_at_time(reservation.time) ? true : false
  end

  def load_reservations_for_restaurant
    Reservation.all.where(restaurant_id: self.id)
  end

end
