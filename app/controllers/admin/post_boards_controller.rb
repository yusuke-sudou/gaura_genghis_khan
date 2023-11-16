class Admin::PostBoardsController < ApplicationController
  def index
    @community = Community.find(params[:community_id])
    @post_boards = @community.post_boards
    @users = User.all
  end
end
