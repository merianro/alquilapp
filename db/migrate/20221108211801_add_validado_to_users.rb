class AddValidadoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :validado, :boolean, default: false
  end
end
