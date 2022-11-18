class AddSuIdToSistemaReportes < ActiveRecord::Migration[7.0]
  def change
    add_column :sistema_reportes, :su_id, :integer
  end
end
