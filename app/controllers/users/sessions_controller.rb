# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #prepend_before_action :require_no_authentication, only: [:cancel ]
  after_action :after_login, only: :create

  protected

  def after_login
    # borra la ubicacion del usuario despues de cada login para setearla de nuevo
    User.find(current_user.id).update(location_point: nil)
  end


  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.banned?
      sign_out resource
      flash[:error] = "This account has been suspended for violation of...."
      root_path
    else
      super
    end
   end
  
end
