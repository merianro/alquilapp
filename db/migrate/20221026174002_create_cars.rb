class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :marca
      t.string :modelo
      t.string :ano
      t.string :color
      t.string :transmision
      t.integer :capacidad

      t.timestamps
    end
  end
end
