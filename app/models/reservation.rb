class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :party_size, numericality: { greater_than: 0 }
  validates :time_field, :date_field, presence: true
  # Line 6 ^ is causing issues with validations. I'll work on it more at home'

  # Implement DateTime splitting and rejoining
  before_save :convert_to_datetime

  def date_field
    time.strftime("%d/%m/%Y") if time.present?
  end

  def time_field
    time.strftime("%I:%M:00") if time.present?
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
end
