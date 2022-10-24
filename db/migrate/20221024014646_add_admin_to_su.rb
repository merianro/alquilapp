class AddAdminToSu < ActiveRecord::Migration[7.0]
  def change
    add_column :sus, :admin, :boolean
  end
end
