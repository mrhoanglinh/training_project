class BlogsController < ApplicationController
  before_action :set_blog, only: [:show]	

  def index    
    @blogs = Blog.select(:id, :title, :category_id, :isSuggest, :datePublic, :interest, :like,
                         :dislike, :disappoint).order('created_at DESC').
    					 page(params[:page]).per(20)  
  end

  private
  	def set_blog
    @blog = Blog.find(params[:id])
  	end
end