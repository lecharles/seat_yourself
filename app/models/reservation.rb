class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :party_size, numericality: { greater_than: 0 }
  validates :time, presence: true

  before_validation :convert_to_datetime
  before_validation :check_availability?, only: :create

  def date_field
    time.strftime("%d/%m/%Y") if time.present?
  end

  def time_field
    time.strftime("%I:%M:%p") if time.present?
  end

  def date_field=(date)
    # Change back to datetime friendly format
      @date_field = Date.parse(date).strftime("%Y-%m-%d")
  end

  def time_field=(time)
    # Change back to datetime friendly format
      @time_field = Time.parse(time).strftime("%H:%M:%S")
  end

  def convert_to_datetime
    self.time = DateTime.parse("#{@date_field} #{@time_field}")
  end

  def hour
    self.time.hour
  end

  def check_availability?
    occupied_seats = Reservation.where(restaurant_id: self.restaurant_id, time: self.time).sum(:party_size)

    occupied_seats + self.party_size <= Restaurant.find(self.restaurant_id).capacity
  end

end
