class Admins::UsersController < ApplicationController
  before_action :set_user
  
  def mypage
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user.update_without_password(user_params)
    redirect_to mypage_users_url
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to request.referer
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.permit(
      :email,
      :name,
      :address,
      :phone,
      :raising_experience,
      :birth_date
      )
  end
end
