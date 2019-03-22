class BlogsController < ApplicationController
  before_action :index

  def index
    @blog = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

end
