class Parametro < ApplicationRecord
  enum tipo: [:Multa, :Tarifa] 
end
