class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
     @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user), notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :postcode, :address, :phone_number, :email, :is_deleted)
  end

end

