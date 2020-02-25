class ListingsController < ApplicationController
  before_action :set_listing, only: [:show]
  def index
    @listings = Listing.all
  end

  def show
    @user = User.new
  end

  def new
  end

  def edit
  end

  private

  def set_listing
    @listing =　Listing.find(params[:id])
  end
end
