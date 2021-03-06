class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up,keys: [:phone])
    devise_parameter_sanitizer.permit(:sign_up,keys: [:is_admin])

    devise_parameter_sanitizer.permit(:account_update,keys: [:name])
    devise_parameter_sanitizer.permit(:account_update,keys: [:phone])
    devise_parameter_sanitizer.permit(:account_update,keys: [:is_admin])

    devise_parameter_sanitizer.permit(:invite,keys: [:name])
    # devise_parameter_sanitizer.permit(:accept_invitation,keys: [:name])
  end

end
