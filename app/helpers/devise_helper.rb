module DeviseHelper
  def devise_error_messages!
    flash[:error] = resource.errors.full_messages.first
  end

  def devise_authentication_error_messages!
    return '' unless flash.alert
    messages = flash.alert
  end
end