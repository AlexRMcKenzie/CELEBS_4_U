class CelebritiesController < ApplicationController

  def index
    @celebrities = Celebrity.all
  end

  def show
    @celebrity = Celebrity.find(params[:id])


    @booking = Booking.new(celebrity: @celebrity)
    @booking = Booking.new
  end

end
