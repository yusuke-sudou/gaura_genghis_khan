class Public::MenusController < ApplicationController
  def index
    @q = Menu.ransack(params[:q])
    @menus_by_genre = @q.result(distinct: true).group_by(&:genre_id)
  end

  def show
    @menu = Menu.find(params[:id])
  end
end
