class Admin::UsersController < ApplicationController
  layout 'admin'

  # def index
  #   if params[:rate_action].nil?
  #   else
  #     @actions = BlogUser.where(action: params[:rate_action].to_i).group(:user_id).count
  #     @users = User.select(:name)
  #
  #   end
  # end

  def list
    unless params[:rate_action].to_i == 0
      @actions = BlogUser.where(action: params[:rate_action].to_i).group(:user_id).count
      @users = User.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end