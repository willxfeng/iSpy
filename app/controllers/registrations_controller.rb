class RegistrationsController < Devise::RegistrationsController
  protected

  # def after_sign_up_path_for(_resource)
  #   flash[:notice] = "You're in!"
  #   :edit_user_registration
  # end
end
