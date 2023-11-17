class Admin::NoticesController < ApplicationController
  before_action :is_matching_login_admin, only: [:edit, :update]
  def index
    @notice = Notice.new
    @notices = Notice.all
  end
  
  def create
    @notices = Notice.all
    @notice = Notice.new(notice_params)
    @notice.admin_id = current_admin.id # 管理者のadmin_idを指定
    if @notice.save
      # お知らせの新規登録が成功した場合の処理
      flash[:notice] = "登録に成功しました。"
      redirect_to admin_notices_path(@notice)
    else
      # お知らせの新規登録が失敗した場合の処理
      flash.now[:alert] = "登録に失敗しました"
      render 'index'
    end
  end
  
  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])
    if @notice.update(notice_params)
      # お知らせの更新が成功した場合の処理
      flash[:notice] = "更新に成功しました。"
      redirect_to admin_notices_path(@notice)
    else
      # お知らせの更新が失敗した場合の処理
      flash.now[:alert] = "更新に失敗しました"
      render 'edit'
    end
  end
  
  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    # お知らせの削除が成功した場合の処理
    flash[:notice] = "削除に成功しました。"
    redirect_to admin_notices_path
  end
  
  private

  def notice_params
    params.require(:notice).permit(:title, :body, :admin_id) # 必要なパラメータをpermit()メソッド内に指定する
  end
  
end
