class AddDisponibleToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :disponible, :boolean
  end
end
