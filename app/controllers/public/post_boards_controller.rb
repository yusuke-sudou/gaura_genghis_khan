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
      # flash[:notice] = "登録に成功しました。"
      # redirect_to community_post_boards_path(@community)
    else
      flash.now[:alert] = "登録に失敗しました"
      render :index
    end
  end
  
  def destroy
    @community = Community.find(params[:community_id]) # 選択したコミュニティを取得
    @post_boards = @community.post_boards
    @post_board = PostBoard.find(params[:id]) # 削除する投稿を取得
    if @post_board.user_id == current_user.id # ログインユーザーと投稿のユーザーが一致しているかチェック
      @post_board.destroy # 投稿を削除
    end
    # flash[:notice] = "削除に成功しました。"
    # redirect_to community_post_boards_path(params[:community_id]) # コミュニティの投稿一覧ページにリダイレクト
  end
  
  private

  def post_board_params
    params.require(:post_board).permit(:user_id, :community_id, :body) # 投稿のパラメータのみを許可する
  end
  
  
end
