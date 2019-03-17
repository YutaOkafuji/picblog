class BlogsController < ApplicationController
  before_action :index

  def index
    @blog = Blog.find(1)
  end
end
