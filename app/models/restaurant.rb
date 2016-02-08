class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :reservations, dependent: :destroy
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
