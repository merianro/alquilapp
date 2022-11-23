class Alquiler < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validate :validado
  validate :saldo_mayor
  validate :usado


  private


  def validado 
    return if User.find(user_id).validado == true
      errors.add :horas, 'Para alquilar debes estar validado.'
  end


  def saldo_mayor
    return if User.find(user_id).saldo >= monto.to_f
      errors.add :horas, 'Debes poseer un saldo mayor en tu billetera.'
  end

  def usado
    return if ((DateTime.now.to_time - @alquilers.where(car_id: car_id).order(:created_at).last.end_date.to_time ) /60 ) < 180
      errors.add :horas, 'Ya alquilaste este vehiculo hace menos de 3 horas, debes esperar antes de volver a alquilarlo.'
  end

end
