class RemoveRoleFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :rol, :integer
  end
end
