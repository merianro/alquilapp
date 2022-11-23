class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  private
  def user_not_authorized
    flash[:error] = "Access Deny"
    redirect_to request.referrer || new_user_session_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :birthdate,:email, :dni, :phone, :vencimiento_licencia, :password, :password_confirmation)}

           # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :birthdate,:email, :dni, :phone, :vencimiento_licencia)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :birthdate,:email, :dni, :phone, :vencimiento_licencia, :current_password, :password, :password_confirmation)}

       end   
end
