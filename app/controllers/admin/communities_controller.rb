class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :update]
  def index
    @community = Community.new
    @communities = Community.all
  end

  def create
    @communities = Community.all
    @community = Community.new(community_params)
    @community.admin_id = current_admin.id # 管理者のadmin_idを指定
    if @community.save
      # コミュニティの新規登録が成功した場合の処理
      flash[:notice] = "登録に成功しました。"
      redirect_to admin_community_url(@community)
    else
      # コミュニティの新規登録が失敗した場合の処理
      flash.now[:alert] = "登録に失敗しました"
      render 'index'
    end
  end

  def show
    @community = Community.find(params[:id])
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])
    if @community.update(community_params)
      # コミュニティの更新が成功した場合の処理
      flash[:notice] = "更新に成功しました。"
      redirect_to admin_community_url@community
    else
      # コミュニティの更新が失敗した場合の処理
      flash.now[:alert] = "更新に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    # コミュニティの削除が成功した場合の処理
    flash[:notice] = "削除に成功しました。"
    redirect_to admin_communities_path
  end
  
  private

  def community_params
    params.require(:community).permit(:name, :explanation, :admin_id) # 必要なパラメータをpermit()メソッド内に指定する
  end
  
  
end
