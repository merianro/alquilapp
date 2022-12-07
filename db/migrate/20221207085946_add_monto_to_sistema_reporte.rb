class AddMontoToSistemaReporte < ActiveRecord::Migration[7.0]
  def change
    add_column :sistema_reportes, :monto, :integer , default: 0
  end
end
