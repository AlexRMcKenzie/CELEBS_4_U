require 'date'

class Booking < ApplicationRecord
  belongs_to :celebrity
  belongs_to :user
  validates :start_date, presence: true # ,  date: { after_or_equal_to: DateTime.now }
  validates :end_date, presence: true # , after_or_equal_to: :start_date
  validate :end_date_is_after_start_date
  validate :start_date_is_after_today

  private

  def end_date_is_after_start_date
    errors.add(:end_date, "cannot be before the start date") if end_date < start_date
  end

  def start_date_is_after_today
    tomorrow = Date.today + 1
    tommorow_midday = [tomorrow.year, tomorrow.month, tomorrow.day + 0.5]
    tommorow_midday = DateTime.new(*tommorow_midday)
    errors.add(:start_date, "cannot be earlier than midday tomorrow") if start_date < tommorow_midday
  end
end
