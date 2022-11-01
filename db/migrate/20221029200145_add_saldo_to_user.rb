class AddSaldoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :saldo, :float, default: 0
  end
end
