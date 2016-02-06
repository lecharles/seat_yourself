class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations

  # @capacity = self.capacity

  def seats_remaining
    @capacity
  end

end
