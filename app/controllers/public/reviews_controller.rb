class Public::ReviewsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  
  # def index
  #   @review = Review.new
  #   @q = Review.ransack(params[:q])
  #   if params[:q].present?
  #     @reviews = @q.result(distinct: true)
  #   else
  #     @reviews = Review.all.order(created_at: :desc) 
  #   end
  # end

  def index
    @review = Review.new
    @q = Review.ransack(params[:q])
    if params[:q].present?
      @reviews = @q.result(distinct: true).page(params[:page]).per(6)  # ページネーションの設定を追加
    else
      @reviews = Review.all.order(created_at: :desc).page(params[:page]).per(6)  # ページネーションの設定を追加
    end
  end
  
  def create
    @q = Review.ransack(params[:q])
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
  
  def is_matching_login_user
    @review = Review.find(params[:id])
    unless @review.user == current_user
      redirect_to reviews_path
    end
  end
  
end
