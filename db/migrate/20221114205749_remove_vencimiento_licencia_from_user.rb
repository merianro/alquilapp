class RemoveVencimientoLicenciaFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :vencimiento_licencia, :date
  end
end
