class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
  end
end
