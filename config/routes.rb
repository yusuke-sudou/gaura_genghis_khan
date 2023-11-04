Rails.application.routes.draw do

# 顧客用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

root 'public/homes#top'


###########public###########
  scope module: :public do
    
    get 'about' => 'homes#about', as: 'about'
    
#掲示板投稿コメント
    resources:post_board_comments,only: [:create,:destroy]
 
#掲示板投稿
    resources:post_boards,only: [:index,:create,:destroy]
 
#いいね機能
    resources:favorites,only: [:index,:create,:destroy]
  
#レビューコメント
    resources:review_comments,only: [:create,:destroy]
  
#レビュー投稿
    resources:reviews,only: [:index, :show,:update,:edit,:destroy]
  
#顧客関係（マイページ、登録情報編集、登録情報更新、一覧画面）
    resources:users,only: [:index, :show,:update,:edit]
  
#メニュー
    resources:menus,only: [:index, :show]
  end
  
######admin##############
  namespace :admin do
#ホーム
    get 'homes/top'
#コミュニティ
    resources :communitys,only: [:index, :create, :show, :edit, :update, :destroy]
  
#メニュー
    resources :menus,only: [:index, :new, :create, :show, :edit, :update]
  
#ジャンル  
    resources :genres,only: [:index, :create, :edit, :update]
  
#顧客関係
    resources :users,only: [:index, :show, :edit, :update]
  
#レビュー投稿へのコメント  
    resources :review_comments,only: [:index, :destroy]
  
#掲示板投稿へのコメント    
    resources :post_board_comments,only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
