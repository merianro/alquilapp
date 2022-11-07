class AddInfoCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :patente, :string
    add_column :cars, :porcentaje_combustible, :float
    add_column :cars, :tipo_de_combustible, :string
  end
end
