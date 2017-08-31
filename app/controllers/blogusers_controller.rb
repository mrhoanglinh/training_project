class BlogusersController < ApplicationController
  def create
    blog_user = BlogUser.where(user_id: params[:user_id],
                               blog_id: params[:blog_id]).first



    if blog_user
      blog_user.update(action: params[:user_action])
    else
      BlogUser.create(user_id: params[:user_id], blog_id: params[:blog_id],
                      action: params[:user_action])
    end

    @count_action = BlogUser.where(blog_id: params[:blog_id])
                        .select(:action)
                        .group(:action).count

    @check_action = blog_user.action


    respond_to do |format|
      format.js
    end
  end
end