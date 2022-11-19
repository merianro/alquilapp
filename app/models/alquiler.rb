class Alquiler < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validate :max_24

private
  def max_24
    return if horas < 24
      errors.add :horas,'El maximo periodo es de 24 horas.'
  end
end
