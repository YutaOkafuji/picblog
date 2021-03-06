class BlogsController < ApplicationController

    before_action :move_to_index, except: [:index,:show]
  def index
    @blog = Blog.includes(:user).page(params[:page]).per(9).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(title: blog_params[:title],image: blog_params[:image],column: blog_params[:column],user_id: current_user.id,remove_image: blog_params[:remove_image])
  end

   def show
    @blog = select_blogs_data
   end

  def destroy
    @blog = select_blogs_data
    @blog.destroy if @blog.user_id == current_user.id
  end

  def edit
    @blog = select_blogs_data
  end

  def update
    @blog = select_blogs_data
    @blog.update(blog_params) if @blog.user_id == current_user.id
  end

  private

  def blog_params
    params.require(:blog).permit(:title,:image,:column,:remove_image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def select_blogs_data
    Blog.find(params[:id])
  end
end
