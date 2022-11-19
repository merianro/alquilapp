class Alquiler < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validate :max_24
  validate :validado


private
  def max_24
    return if horas < 24
      errors.add :horas,'El maximo periodo es de 24 horas.'
  end

  def validado 
    return if User.find(user_id).validado == true
      errors.add :horas, 'Para alquilar debes estar validado.'
  end
end
