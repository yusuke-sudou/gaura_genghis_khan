class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  def show
    @user = current_user
    @reviews = Review.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
        if @user.update(user_params)
        flash[:notice] = "更新に成功しました。"
        redirect_to user_path(@user.id)
        else
        render :edit
        end 
  end
  
  def favorites
    @review = Review.new
    @user = current_user
    @favorite_reviews = @user.favorites.includes(:review)
    render 'favorites'
  end
  
  def leave
      current_user.update(is_active: false)
      # セッションをリセット
      ## ログインはセッションで管理されているので、そのデータを削除
      reset_session
      redirect_to root_path, notice: "退会しました。"
  end 
  
  private

  def user_params
    params.require(:user).permit(:name,:email)
  end
  
  def ensure_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
  
  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
end
