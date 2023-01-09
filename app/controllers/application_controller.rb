class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(
    :account_update,
    keys: [:password, :password_confirmation, :current_password]
  )
  end

  helper_method :current_user_can_edit?, :current_user_can_subscribe?

  def current_user_can_edit?(event)
    user_signed_in? && event.user == current_user
  end

  def current_user_can_subscribe?(event)
    (user_signed_in? && event.user != current_user) || !user_signed_in?
  end
end
