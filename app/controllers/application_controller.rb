class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address, :name, :last_name, :image, :birth_date, :security_question, :security_answer])
  end
  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      edit_user_registration_path
    else
      root_path
    end
  end
end
