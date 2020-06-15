class ApplicationController < ActionController::Base
  before_action :configure_permitted_parametres, if: :devise_controller?

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      super
    end
  end

  protected

  def configure_permitted_parametres
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
