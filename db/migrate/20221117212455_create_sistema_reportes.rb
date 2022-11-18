class CreateSistemaReportes < ActiveRecord::Migration[7.0]
  def change
    create_table :sistema_reportes do |t|

      t.timestamps
    end
  end
end
