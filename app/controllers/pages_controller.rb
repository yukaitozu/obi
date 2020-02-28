class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout 'home', only: :home
  def home
  end

  def dashboard
    @listings = current_user.listings
  end
end
