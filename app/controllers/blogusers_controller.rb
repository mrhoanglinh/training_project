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
    UpdateactionJob.set(wait: 3.seconds).perform_later(params[:blog_id])

    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end
end