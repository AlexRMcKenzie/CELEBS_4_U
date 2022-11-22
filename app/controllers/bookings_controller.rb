require 'date'

class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[new create]

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
    @condition0 = Booking.where(start_date: @dates).count.zero?
    @condition1 = Booking.where(end_date: @dates).count.zero?
    @condition2 = Booking.where(start_date: ..new_start_date)
                         .where(end_date: new_end_date..).count.zero?
    if @condition = @condition0 && @condition1 && @condition2
      @booking.celebrity = @celebrity
      @booking.user = current_user
      if @booking.save
        redirect_to booking_path(@booking)
      else
        render :new, status: :unprocessable_entity
      end
    else
      pass
    end
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location, :celebrity_id, :user_id)
  end
end
