class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations

  def total_diners
    @total_diners = 0
      Reservation.all.where(restaurant_id: self.id).each do |res|
        @total_diners += res.party_size
      end
    @total_diners
  end

  def available?
    capacity > total_diners ? true : false
  end

end
