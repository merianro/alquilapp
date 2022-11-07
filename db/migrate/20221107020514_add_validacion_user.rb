class AddValidacionUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :validado, :boolean
  end
end
