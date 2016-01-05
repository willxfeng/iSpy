class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    :edit_user_registration
  end

  def after_inactive_sign_up_path_for(_resource)
    :edit_user_registration
  end

  def after_update_path_for(_resource)
    :edit_user_registration
  end
end
