class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @blog = user.blogs.page(params[:id]).per(5).order('created_at DESC')
  end

end
