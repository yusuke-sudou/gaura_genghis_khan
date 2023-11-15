class Public::PostBoardsController < ApplicationController
  def index
    @community = Community.find(params[:community_id])
    @post_board = PostBoard.new
    @post_boards = @community.post_boards
    @users = User.all
  end
  
  def create
    @community = Community.find(params[:community_id]) # 選択したコミュニティを取得
    @post_boards = @community.post_boards
    @post_board = @community.post_boards.build(post_board_params) # コミュニティに紐づく投稿を作成し、パラメータを設定
    @post_board.user_id = current_user.id 
    if @post_board.save
      redirect_to community_post_boards_path(@community)
    else
      render :index
    end
  end
  
  def destroy
  end
  
  private

  def post_board_params
    params.require(:post_board).permit(:user_id, :community_id, :body) # 投稿のパラメータのみを許可する
  end
  
  
end
