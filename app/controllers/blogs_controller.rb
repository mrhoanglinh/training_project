class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :get_blog, only: [:show]

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


    @blogs = Blog.includes(:category).select(:id, :title, :image, :category_id,
                                             :isSuggest, :datePublic)
                 .where(isPublic: 1)
                 .order('datePublic DESC')
                 .paginate(page: params[:page], per_page: 15)

    @blogs_public_list = Blog.includes(:category).select(:id, :title, :image, :category_id,
                                                         :isSuggest, :datePublic)
                             .where(isSuggest: 1, isPublic: 1)
                             .order('datePublic DESC')
                             .paginate(page: params[:page], per_page: 7)

    @blogs_cate1_list = Blog.includes(:category).select(:id, :title,:image, :category_id,
                                               :isSuggest, :datePublic)
                   .where(category_id: 1 , isPublic: 1)
                   .order('datePublic DESC')
                   .paginate(page: params[:page], per_page: 15)

    @blogs_cate2_list = Blog.includes(:category).select(:id, :title,:image, :category_id,
                                                        :isSuggest, :datePublic)
                            .where(category_id: 2 , isPublic: 1)
                            .order('datePublic DESC')
                            .paginate(page: params[:page], per_page: 15)

    @blogs_cate3_list = Blog.includes(:category).select(:id, :title,:image, :category_id,
                                                        :isSuggest, :datePublic)
                            .where(category_id: 3 , isPublic: 1)
                            .order('datePublic DESC')
                            .paginate(page: params[:page], per_page: 15)

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

    @blog_comments = @blog.comments.includes(:user).order('created_at ASC')

  end

  private

  def get_blog
    @blog = Blog.find(params[:id])
  end
end