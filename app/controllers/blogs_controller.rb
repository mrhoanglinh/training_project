class BlogsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  before_action :set_blog, only: [:show]

  def index
    @count_action_interest = BlogUser.where(action: 1)
                        .select(:action)
                        .group(:blog_id).count

    @count_action_like = BlogUser.where(action: 2)
                        .select(:action)
                        .group(:blog_id).count

    @count_action_dislike = BlogUser.where(action: 3)
                             .select(:action)
                             .group(:blog_id).count

    @count_action_disappoint = BlogUser.where(action: 4)
                             .select(:action)
                             .group(:blog_id).count

    if params[:category].nil?
      @blogs = Blog.includes(:category).select(:id, :title, :image, :category_id,
                                               :isSuggest, :datePublic)
                   .where(isPublic: 1)
                   .order('datePublic DESC')
                   .paginate(page: params[:page], per_page: 15)
    else
      @blogs = Blog.includes(:category).select(:id, :title,:image, :category_id,
                                               :isSuggest, :datePublic)
                   .where(category_id: params[:category].to_i , isPublic: 1)
                   .order('datePublic DESC')
                   .paginate(page: params[:page], per_page: 15)
    end

    if params[:isSuggest].to_i == 1
      @blogs = Blog.includes(:category).select(:id, :title, :image, :category_id,
                                               :isSuggest, :datePublic)
                   .where(isSuggest: 1, isPublic: 1)
                   .order('datePublic DESC')
                   .paginate(page: params[:page], per_page: 15)
    end

    @categories = Category.all
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

  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end
end