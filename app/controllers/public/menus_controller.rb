class Public::MenusController < ApplicationController
  def index
    @menus_by_genre = Menu.all.group_by(&:genre_id)
  end

  def show
    @menu = Menu.find(params[:id])
  end
end
