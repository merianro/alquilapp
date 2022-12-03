class DropParametros < ActiveRecord::Migration[7.0]
  def change
    drop_table :parametros
  end
end
