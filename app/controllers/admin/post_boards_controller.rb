class Admin::PostBoardsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :destroy]

  def index
    @community = Community.find(params[:community_id])
    @post_boards = @community.post_boards
    @users = User.all
  end
  
  def destroy
    @post_board = PostBoard.find(params[:id])
    @community = @post_board.community
    @post_board.destroy
    flash[:notice] = "削除に成功しました。"
    redirect_to admin_community_post_boards_path(community_id: @community.id)
  end
  
end
