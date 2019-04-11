class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @blog = user.blogs.page(params[:page]).per(10).order('created_at DESC')
  end

  def edit
    user = User.find(params[:id])
  end
end
