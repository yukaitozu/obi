class UsersController < ApplicationController
  # has_one_attached :photo
  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
