class AddAlquilerActivoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :alquiler_activo, :boolean , default: false
  end
end
