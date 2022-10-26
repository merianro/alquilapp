class AddTipoToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :tipo, :string
  end
end
