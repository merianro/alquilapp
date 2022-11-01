class CreateValidarMps < ActiveRecord::Migration[7.0]
  def change
    create_table :validar_mps do |t|

      t.timestamps
    end
  end
end
