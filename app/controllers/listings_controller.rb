class ListingsController < ApplicationController
  before_action :set_listing, only: [:show]
  skip_before_action :authenticate_user!, only: [:show, :index]
  
  def index
    @listings = Listing.all
    @listings = policy_scope(Listing)
  end

  def show
    @user = User.new
    authorize @listing
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def edit

  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :photo, :price, :color, :size, :category, :average_rating)
  end
end
