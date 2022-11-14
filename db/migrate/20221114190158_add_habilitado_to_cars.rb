class AddHabilitadoToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :habilitado, :boolean, default: true
  end
end
