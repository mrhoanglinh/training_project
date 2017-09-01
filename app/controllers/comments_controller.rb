class CommentsController < ApplicationController
  before_action :find_blog, only: [:create]

  def create
    if params[:comment][:content].present?
      @comment = @blog.comments.create(comment_params)
      @comment.user = current_user
      flash[:success] = t"blog.show.comment_success"
    end
  end

  private

  def find_blog
    @blog = Blog.find(params[:comment][:blog_id])
    unless @blog
      redirect_to root_url
    end
  end

  def comment_params
    params.require(:comment).permit(:blog_id, :user_id, :content)
  end
end