class AddMontoToAlquiler < ActiveRecord::Migration[7.0]
  def change
    add_column :alquilers, :monto, :integer
  end
end
