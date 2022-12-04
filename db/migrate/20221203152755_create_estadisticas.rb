class CreateEstadisticas < ActiveRecord::Migration[7.0]
  def change
    create_table :estadisticas do |t|

      t.timestamps
    end
  end
end
