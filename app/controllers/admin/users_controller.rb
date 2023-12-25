class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :destroy]
  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])

  end

  def edit
  end

  def update
  end
  
  def destroy
    user = User.find(params[:id])
    user.update(is_active: false)
    reset_session
    flash[:notice] = '会員が退会しました'
    redirect_to admin_users_path
  end
  
end
