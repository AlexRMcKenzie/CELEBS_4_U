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

  def new
    @celebrity = Celebrity.find(params[:celebrity_id])
    @booking = Booking.new
  end

  def create
    @celebrity = Celebrity.find(params[:celebrity_id])
    @booking = Booking.new(booking_params)
    new_start_date = [params[:booking]["start_date(1i)"],
                      params[:booking]["start_date(2i)"],
                      params[:booking]["start_date(3i)"],
                      params[:booking]["start_date(4i)"],
                      params[:booking]["start_date(5i)"]]
    new_start_date = new_start_date.map(&:to_i)
    new_start_date = DateTime.new(*new_start_date)
    new_end_date = [params[:booking]["end_date(1i)"],
                    params[:booking]["end_date(2i)"],
                    params[:booking]["end_date(3i)"],
                    params[:booking]["end_date(4i)"],
                    params[:booking]["end_date(5i)"]]
    new_end_date = new_end_date.map(&:to_i)
    new_end_date = DateTime.new(*new_end_date)
    @dates = new_start_date..new_end_date
    @condition0 = Booking.where(celebrity_id: @celebrity.id)
                         .where(start_date: @dates).count.zero?
    @condition1 = Booking.where(celebrity_id: @celebrity.id)
                         .where(end_date: @dates).count.zero?
    @condition2 = Booking.where(celebrity_id: @celebrity.id)
                         .where(start_date: ..new_start_date)
                         .where(end_date: new_end_date..).count.zero?
    @condition = @condition0 && @condition1 && @condition2
    @booking.celebrity = @celebrity
    @booking.user = current_user
    # raise
    if @booking.valid? && @condition
      @booking.save
      redirect_to booking_path(@booking)
    elsif !@booking.valid?
      render :new, status: :unprocessable_entity
    else
      redirect_to new_celebrity_booking_path(@celebrity), alert: "Not available dates"
    end
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location, :celebrity_id, :user_id)
  end
end
