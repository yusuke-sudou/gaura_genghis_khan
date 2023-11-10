class Public::ReviewsController < ApplicationController
  def index
    @review = Review.new
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "投稿に成功しました。"
      @reviews = Review.all
      redirect_to reviews_path
    else
      @reviews = Review.all
      flash.now[:alert] = "登録に失敗しました"
      render :index
    end
  end
  
  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to review_path(@review.id) 
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    review = Review.find(params[:id])  
    review.destroy
    flash[:notice] = "削除に成功しました。"
    redirect_to reviews_path
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body, :image)  
  end
  
end
