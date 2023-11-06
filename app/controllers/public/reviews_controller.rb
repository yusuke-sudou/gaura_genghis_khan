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
      render :index
    end
  end
  
  def show
    @review = Review.find(params[:id]) 
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
      render :edit
    end
  end
  
  def destroy
    review = Review.find(params[:id])  
    review.destroy  
    redirect_to reviews_path
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body, :image)  
  end
  
end
