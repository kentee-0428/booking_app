class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def account
    @user = User.find(current_user.id)
  end

  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :image_name, :introduction))
      flash[:notice] = "#{@user.name}の情報を更新しました"
      redirect_to root_path
    else
      render "profile"
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    flash[:notice] = "ユーザーを削除しました。"
    redirect_to root_path
  end
end
