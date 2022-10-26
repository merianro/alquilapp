class AddUbicationToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :ubication, :point
  end
end
