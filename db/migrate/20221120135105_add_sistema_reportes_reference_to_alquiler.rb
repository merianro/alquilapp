class AddSistemaReportesReferenceToAlquiler < ActiveRecord::Migration[7.0]
  def change
    add_reference :sistema_reportes, :alquiler

  end
end
