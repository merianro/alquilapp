class CreateParametros < ActiveRecord::Migration[7.0]
  def change
    create_table :parametros do |t|
      t.integer :tarifa

      t.timestamps
    end
  end
end
