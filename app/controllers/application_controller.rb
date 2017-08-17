class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :warning, :danger, :info

  private
  def authenticate_user!
    if user_signed_in?
      super
    else
      store_location_for :user, request.url
      redirect_to user_session_path
    end
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      user_session_path
    elsif resource_or_scope == :admin
      admin_session_path
    else
      root_path
    end
  end
end
