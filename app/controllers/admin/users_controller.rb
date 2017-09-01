class Admin::UsersController < ApplicationController
  layout 'admin'

  def list
    unless params[:rate_action].to_i == 0
      @actions = BlogUser.where(action: params[:rate_action].to_i).group(:user_id).count
      @users = User.select(:id, :email, :name, :avatar)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end