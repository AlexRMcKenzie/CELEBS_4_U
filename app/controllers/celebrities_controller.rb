class CelebritiesController < ApplicationController

  def index
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @celebrities = Celebrity.where(sql_query, query: "%#{params[:query]}%")
    else
      @celebrities = Celebrity.all
    end
  end

  def show
    @celebrity = Celebrity.find(params[:id])


    @booking = Booking.new(celebrity: @celebrity)
    @booking = Booking.new
  end

end
