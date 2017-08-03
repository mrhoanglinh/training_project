class Admin::Blogs::CommentsController < ApplicationController
  before_action :find_blog, only: [:index, :destroy]
  layout 'admin'

  def index
    @comments = @blog.comments.reverse
  end

  def destroy
    @comment = @blog.comments.find_by(id: params[:id]).destroy
    @comments = @blog.comments
    respond_to do |format|
      format.js
    end
  end

  private
  def find_blog
    @blog = Blog.find_by id: params[:blog_id]
  end
end