class CreateMercadoPagos < ActiveRecord::Migration[7.0]
  def change
    create_table :mercado_pagos do |t|

      t.timestamps
    end
  end
end
