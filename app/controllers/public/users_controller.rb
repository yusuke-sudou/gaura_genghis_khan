class Public::UsersController < ApplicationController
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
  
  private

  def user_params
    params.require(:user).permit(:name,:email)
  end
  
end
