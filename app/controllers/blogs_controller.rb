class BlogsController < ApplicationController

  def index
    @blog = Blog.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Blog.create(title: blog_params[:title],image: blog_params[:image],column: blog_params[:column])
  end

  def destroy
  end

  private

  def blog_params
    params.permit(:title,:image,:column,:user_id)
  end

end
