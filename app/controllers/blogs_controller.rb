class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :get_blog, only: [:show]

  def index
    @count_action_interest = BlogUser.action_interest
    @count_action_like = BlogUser.action_like
    @count_action_dislike = BlogUser.action_dislike
    @count_action_disappoint = BlogUser.action_disappoint


    @blogs = Blog.includes(:category).blog_all
                 .paginate(page: params[:page], per_page: 15)
    @blogs_public_list = Blog.includes(:category).blog_public
                             .paginate(page: params[:page], per_page: 10)
    @blogs_list1 = Blog.includes(:category).blog_list1
                            .paginate(page: params[:page], per_page: 10)
    @blogs_list2 = Blog.includes(:category).blog_list2
                            .paginate(page: params[:page], per_page: 10)
    @blogs_list3 = Blog.includes(:category).blog_list3
                            .paginate(page: params[:page], per_page: 10)

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