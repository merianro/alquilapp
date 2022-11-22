class Alquiler < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validate :validado
  validate :horas_no_nulas
  validate :cantidad_no_nula
  validate :saldo_mayor
  validate :max_24, if: :condicion1


private
  def max_24
    puts "Entre--------------------------yyyy"
    return if horas < 24
      errors.add :horas,'El maximo periodo es de 24 horas.'
  end

  def validado 
    return if User.find(user_id).validado == true
      errors.add :horas, 'Para alquilar debes estar validado.'
  end

  def horas_no_nulas
    puts "------------------------------------------------------1"
    puts(horas)
    return if horas != nil
      errors.add :horas, ':Debe seleccionar un valor de horas a alquilar.'

  end

  def cantidad_no_nula
    puts "---------------------------------------------------2-"
    puts(horas==nil)
    return if cantidad_ocupantes != nil
      puts(horas==nil)
      errors.add :cantidad_ocupantes, ':Debe seleccionar una cantidad de ocupantes a utilizar el vehiculo.'
  end

  def saldo_mayor
    puts "-------------------------------------------------------------------3------"
    puts(horas==nil)
    return if User.find(user_id).saldo >= monto.to_f
      errors.add :horas, ':Debes poseer un saldo mayor en tu billetera.'
  end
end
