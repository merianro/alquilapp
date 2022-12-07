class Parametro < ApplicationRecord
  enum tipo: [:Multa, :Tarifa] 
  validates :monto, numericality: {only_integer: true}
end
