class AddPatenteToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :patente, :string
  end
end
