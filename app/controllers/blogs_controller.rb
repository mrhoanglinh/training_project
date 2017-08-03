class BlogsController < ApplicationController
  def index
    #@blog_count = Blog.cache_blog_count
    @blogs = Blog.select(:id, :title, :category_id, :isPublic,
                         :isSuggest, :interest, :like,
                         :dislike, :disappoint).order('created_at DESC').
    					 page(params[:page]).per(20)
  end

  private
  	def set_blog
    @blog = Blog.find(params[:id])
  	end
end