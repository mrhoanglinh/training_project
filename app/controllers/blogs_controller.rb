class BlogsController < ApplicationController
  before_action :set_blog, only: [:show]

  def index
    @blogs = Blog.includes(:category).select(:id, :title, :category_id,
                                             :isSuggest, :datePublic, :interest,
                                             :like, :dislike, :disappoint)
                 .order('created_at DESC')
                 .paginate(page: params[:page],
                           per_page: 5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @blog = Blog.find(params[:id])
    if current_user
      @action = BlogUser.where(user_id: current_user.id,
                               blog_id: @blog.id).first

      @check_action = @action.action if @action
    end

    @count_action = BlogUser.where(blog_id: @blog.id)
                        .select(:action)
                        .group(:action).count

    @blog_comments = @blog.comments.includes(:user).order('created_at ASC')

  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end
end