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
    @menu = Menu.find(params[:id])
    @genres = Genre.all
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      # メニューの更新が成功した場合の処理
      redirect_to admin_menu_path(@menu.id)
    else
      # メニューの更新が失敗した場合の処理
      render 'edit'
    end
  end
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    # メニューの削除が成功した場合の処理
    redirect_to admin_menus_path
  end
  
  private

  def menu_params
    params.require(:menu).permit(:name, :price, :explanation,:genre_id,:image)
  end

end
