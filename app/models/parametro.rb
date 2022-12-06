class Parametro < ApplicationRecord
  validates :tarifa, :tarifa_extension, :multa_combustible, :multa_auto_sucio, :multa_tiempo_excedido, numericality: { only_integer: true }
end
