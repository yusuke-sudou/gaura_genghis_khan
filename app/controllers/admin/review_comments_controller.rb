class Admin::ReviewCommentsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :destroy]

  def index
    @review_comments = ReviewComment.all
    @users = User.all
  end

  def destroy
    @review_comment = ReviewComment.find(params[:id])
    @review_comment.destroy
    redirect_to admin_review_comments_path
  end

end
