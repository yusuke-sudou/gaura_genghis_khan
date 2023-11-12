class Public::HomesController < ApplicationController
  def top
    # 新規作成順に並び替えて、5件のItemモデルを取得
    @new_reviews = Review.order(created_at: :desc).limit(4)
    @users = User.all
  end
  
  def about
  end
  
  def index
  end
  
end
