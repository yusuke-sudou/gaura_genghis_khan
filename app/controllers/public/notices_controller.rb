class Public::NoticesController < ApplicationController
  def index
    @notices = Notice.all
  end
end
