class AddActivoToAlquilers < ActiveRecord::Migration[7.0]
  def change
    add_column :alquilers, :activo, :boolean, default: false
  end
end
