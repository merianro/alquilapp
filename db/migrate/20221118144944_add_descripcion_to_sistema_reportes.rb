class AddDescripcionToSistemaReportes < ActiveRecord::Migration[7.0]
  def change
    add_column :sistema_reportes, :descripcion, :text
  end
end
