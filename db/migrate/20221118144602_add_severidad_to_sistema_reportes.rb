class AddSeveridadToSistemaReportes < ActiveRecord::Migration[7.0]
  def change
    add_column :sistema_reportes, :severidad, :integer
  end
end
