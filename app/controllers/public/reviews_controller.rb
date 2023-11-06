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
  end

  def edit
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body, :image)  
  end
  
end
