class Public::HomesController < ApplicationController
  def top
    # 新規作成順に並び替えて、1件のモデルを取得
    @new_reviews = Review.order(created_at: :desc).limit(1)
    @users = User.all
    @new_notices = Notice.order(created_at: :desc).limit(1)
  end
  
  def about
  end
  
  def check
  end
  
end
