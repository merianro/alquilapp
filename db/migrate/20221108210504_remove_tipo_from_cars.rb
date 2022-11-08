class RemoveTipoFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :tipo, :string
  end
end
