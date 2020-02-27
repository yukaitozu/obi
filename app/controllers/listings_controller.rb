class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @listings = Listing.all
    @listings = policy_scope(Listing)
    if params[:query]
      @listings = @listings.search_by_title_and_description(params[:query])
    end

    if params[:color]
      @listings = @listings.where(color: params[:color])
    end

    if params[:category]
      @listings = @listings.where(category: params[:category])
    end
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
      redirect_to dashboard_path(@listing)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @listing.update(listing_params)
    redirect_to dashboard_path(@listing)
  end

  def destroy
    @listing.destroy
    redirect_to dashboard_path
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
