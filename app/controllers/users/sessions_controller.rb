# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #prepend_before_action :require_no_authentication, only: [:cancel ]
  after_action :after_login, only: :create

  protected

  def after_login
    # borra la ubicacion del usuario despues de cada login para setearla de nuevo
    User.find(current_user.id).update(location_point: nil)
  end
  
end
