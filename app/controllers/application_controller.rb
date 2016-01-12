class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [
      :first_name,
      :last_name,
      :profile_photo
    ]

    devise_parameter_sanitizer.for(:account_update) << :profile_photo
  end

  def authenticate_user
    if !user_signed_in?
      raise_error
    end
  end

  def raise_error
    raise ActionController::RoutingError.new("Not Found")
  end
end
