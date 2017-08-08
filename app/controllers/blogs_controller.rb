class BlogsController < ApplicationController
  before_action :set_blog, only: [:show]	

  def index    
    @blogs = Blog.includes(:category).select(:id, :title, :category_id, :isSuggest, :datePublic, :interest, :like,
                         :dislike, :disappoint).order('created_at DESC').page(params[:page]).per(5)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private
  	def set_blog
    @blog = Blog.find(params[:id])
  	end
end