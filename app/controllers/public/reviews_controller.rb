class Public::ReviewsController < ApplicationController
  def index
    @review = Review.new
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to reviews_path
  end
  
  def show
    @review = Review.find(params[:id]) 
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to review_path(review.id) 
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body, :image)  
  end
  
end
