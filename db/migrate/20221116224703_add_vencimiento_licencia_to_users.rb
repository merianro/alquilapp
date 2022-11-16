class AddVencimientoLicenciaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vencimiento_licencia, :date
  end
end
