class AddDniToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :dni, :integer
  end
end
