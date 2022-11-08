class RemovePatenteFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :patente, :integer
  end
end
