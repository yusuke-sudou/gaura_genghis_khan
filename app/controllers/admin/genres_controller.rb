class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :create, :edit, :update]
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "新しいジャンル名を追加しました"
      redirect_to admin_genres_path
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
      flash[:notice] = "ジャンル名を変更しました"
      redirect_to admin_genres_path
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
