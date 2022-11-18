class AddFinalizadoToSistemaReportes < ActiveRecord::Migration[7.0]
  def change
    add_column :sistema_reportes, :finalizado, :boolean
  end
end
