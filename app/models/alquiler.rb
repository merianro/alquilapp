class Alquiler < ApplicationRecord
  has_one :sistema_reporte
  belongs_to :user
  belongs_to :car
  validate :validado
  validate :saldo_mayor


  private


  def validado 
    return if User.find(user_id).validado == true
      errors.add :horas, 'Para alquilar debes estar validado.'
  end


  def saldo_mayor
    return if User.find(user_id).saldo >= monto.to_f
      errors.add :horas, 'Debes poseer un saldo mayor en tu billetera.'
  end

end
