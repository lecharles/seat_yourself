class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :party_size, numericality: { greater_than: 0 }
  validates :time, presence: true
  # Still need to validate when no information passed to date or time

  # Implement DateTime splitting and rejoining
  before_validation :convert_to_datetime

  def date_field
    time.strftime("%d/%m/%Y") if time.present?
  end

  def time_field
    time.strftime("%I:%M:%p") if time.present?
  end

  def date_field=(date)
    # if date_field.present?
    # Change back to datetime friendly format
      @date_field = Date.parse(date).strftime("%Y-%m-%d")
    # else
      # @date_field = Date.tomorrow
    # end
  end

  def time_field=(time)
    # if time_field.present?
    # Change back to datetime friendly format
      @time_field = Time.parse(time).strftime("%H:%M:%S")
    # else
      # @time_field = "19:00:00"
    # end
  end

  def convert_to_datetime
    self.time = DateTime.parse("#{@date_field} #{@time_field}")
  end
end
