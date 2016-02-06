class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations

  def total_diners
    @total_diners = 0
      self.reservations.each do |res|
        @total_diners += res.party_size
      end
    @total_diners
  end

  def test
    "test"
  end
end
