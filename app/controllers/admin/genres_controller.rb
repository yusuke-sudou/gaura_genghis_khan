class Admin::GenresController < ApplicationController
  before_action :is_matching_login_admin, only: [:edit, :update]
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, flash[:notice] = "新しいジャンル名「#{@genre.name}」を追加しました"
    else
      @genres = Genre.all
      flash.now[:alert] = "追加に失敗しました"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, flash[:notice] = "ジャンル名を#{@genre.name}へ変更しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end
  
  private

  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
