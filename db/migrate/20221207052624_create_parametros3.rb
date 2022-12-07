class CreateParametros3 < ActiveRecord::Migration[7.0]
  def change
    create_table :parametros do |t|
      t.integer :monto, default: 0
      t.string :nombre
      t.integer :tipo
      t.timestamps
    end
  end
end
