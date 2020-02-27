class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
    authorize @user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_info, :password, :password_confirmation)
  end
end
