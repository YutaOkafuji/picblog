class BlogsController < ApplicationController

    before_action :move_to_index, except: :index
  def index
    @blog = Blog.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Blog.create(title: blog_params[:title],image: blog_params[:image],column: blog_params[:column])
  end

   def show
    @blog = Blog.find(params[:id])
   end

  def destroy
  end

  private

  def blog_params
    params.permit(:title,:image,:column,:user_id)
  end

  def move_to_index
    redirect_to action: :index
  end

end
