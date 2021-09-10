class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.id
    @post = User.id
    @posts = Post.all
    @plans = Plan.all
  end
  
  def unsubscribe
    @user = current_user # current_user.id? 特定のユーザを指定
  end
  
  def withdraw
    @user = current_user # current_user.id? 特定のユーザを指定
    @user.update(is_active: false)
    reset_session
    redirect_to admin_users_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :uid, :provider, :is_active)
  end
  
end