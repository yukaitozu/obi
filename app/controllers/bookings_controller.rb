class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new(booking_params)
    @booking.borrower = current_user
    @booking.listing = @listing
    if @booking.save
      raise
      redirect_to listings_path(@listing)
    else
      render :new
    end
    authorize @booking
  end

  def approved?

  end

  def approve

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :return_date)
  end
end
