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
    # @booking.user = current_user
    @booking.listing = @listing
    if @booking.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :return_date)
  end
end
