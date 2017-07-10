class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  add_flash_types :success, :warning, :danger, :info

  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
end
