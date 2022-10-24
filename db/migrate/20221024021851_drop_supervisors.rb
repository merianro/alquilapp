class DropSupervisors < ActiveRecord::Migration[7.0]
  def change
    drop_table :supervisors
  end
end
