class Public::HomesController < ApplicationController
  def top
    # 新規作成順に並び替えて、3件のItemモデルを取得
    @new_reviews = Review.order(created_at: :desc).limit(3)
    @users = User.all
    @new_notices = Notice.order(created_at: :desc).limit(1)
  end
  
  def about
  end
  
  def check
  end
  
end
