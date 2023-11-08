class Admin::MenusController < ApplicationController
  def index
    @menus_by_genre = Menu.all.group_by(&:genre_id)
  end

  def new
    @menu = Menu.new
    @genres = Genre.all
  end

  def create
    @menu = Menu.new(menu_params)
    # ジャンルの情報を関連付けるために、ジャンルIDを設定する例
    @menu.genre_id = params[:menu][:genre_id]
    if @menu.save
      # メニューの新規登録が成功した場合の処理
      redirect_to admin_menu_path(@menu.id)
    else
      # メニューの新規登録が失敗した場合の処理
      render 'new'
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  private

  def menu_params
    params.require(:menu).permit(:name, :price, :explannation,:genre_id)
  end

end
