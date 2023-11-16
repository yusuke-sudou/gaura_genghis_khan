class Admin::NoticesController < ApplicationController
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
  
  private

  def notice_params
    params.require(:notice).permit(:title, :body, :admin_id) # 必要なパラメータをpermit()メソッド内に指定する
  end
  
end
