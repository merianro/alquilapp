class AddMessageReferenceToSistemaReporte < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :sistema_reporte
  end
end
