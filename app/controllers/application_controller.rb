class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :banned?

  private
  def user_not_authorized
    flash[:error] = "Access Deny"
    redirect_to request.referrer || new_user_session_path
  end

  def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      flash[:error] = "This account has been suspended...."
      root_path
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :birthdate,:email, :dni, :phone, :vencimiento_licencia, :password, :password_confirmation)}

           # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :birthdate,:email, :dni, :phone, :vencimiento_licencia)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :birthdate,:email, :dni, :phone, :vencimiento_licencia, :current_password, :password, :password_confirmation)}

       end   
end
