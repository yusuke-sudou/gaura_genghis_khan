class Public::ReviewCommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    comment = current_user.review_comments.build(review_comment_params)
    comment.review_id = @review.id
  
    if comment.save
      # コメントの保存に成功した場合の処理
    else
      # コメントの保存に失敗した場合の処理
      redirect_to review_path(@review), alert: '未入力コメントは投稿できません。'
    end
  end
  
  def destroy
    ReviewComment.find(params[:id]).destroy
    @review = Review.find(params[:review_id])
    # redirect_to review_path(params[:review_id])
  end
  
  private

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
  
end
