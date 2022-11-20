class AddCantidadOcupantesToAlquiler < ActiveRecord::Migration[7.0]
  def change
    add_column :alquilers, :cantidad_ocupantes, :integer, default: 1
  end
end
