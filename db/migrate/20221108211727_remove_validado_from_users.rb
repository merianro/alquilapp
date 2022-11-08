class RemoveValidadoFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :validado, :boolean
  end
end
