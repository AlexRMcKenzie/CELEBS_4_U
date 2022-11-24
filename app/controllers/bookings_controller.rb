class BookingsController < ApplicationController
  def index
    bookings = Booking.where(user_id: current_user.id)
    bookings = bookings.map do |booking|
      [booking, Celebrity.find(booking.celebrity_id)]
    end
    @bookings = bookings.sort_by { |booking| booking[0].start_date }
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @celebrity = Celebrity.find(params[:celebrity_id])
    @booking = Booking.new(booking_params)
    dates = start_end_dates(@booking)
    new_start_date = dates[0]
    new_end_date = dates[1]
    @condition = condition(@celebrity, new_start_date, new_end_date)
    @booking.celebrity = @celebrity
    @booking.user = current_user
    create_or_not(@booking, @condition, @celebrity)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location, :celebrity_id, :user_id)
  end

  def start_end_dates(booking)
    new_start_date = booking['start_date']
    new_end_date = booking['end_date']
    @start_end_dates = [new_start_date, new_end_date]
  end

  def condition(celebrity, new_start_date, new_end_date)
    dates = new_start_date..new_end_date
    condition0 = Booking.where(celebrity_id: celebrity.id)
                        .where(start_date: dates).count.zero?
    condition1 = Booking.where(celebrity_id: celebrity.id)
                        .where(end_date: dates).count.zero?
    condition2 = Booking.where(celebrity_id: celebrity.id)
                        .where(start_date: ..new_start_date)
                        .where(end_date: new_end_date..).count.zero?
    @condition = condition0 && condition1 && condition2
  end

  def create_or_not(booking, condition, celebrity)
    if booking.valid? && condition
      booking.save
      redirect_to booking_path(booking)
    elsif !@booking.valid?
      render 'celebrities/show', status: :unprocessable_entity
    else
      redirect_to celebrity_path(celebrity), alert: "Not available dates"
    end
  end
end
