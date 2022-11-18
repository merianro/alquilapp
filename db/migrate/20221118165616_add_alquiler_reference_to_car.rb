class AddAlquilerReferenceToCar < ActiveRecord::Migration[7.0]
  def change
    add_reference :alquilers, :car
  end
end
