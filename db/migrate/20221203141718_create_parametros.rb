class CreateParametros < ActiveRecord::Migration[7.0]
  def change
    create_table :parametros do |t|
      t.integer :tarifa, default: 0
      t.integer :tarifa_extension, default: 0
      t.integer :multa_combustible, default: 0
      t.integer :multa_auto_sucio, default: 0     
      t.integer :multa_tiempo_excedido, default: 0

      t.timestamps
    end
  end
end
