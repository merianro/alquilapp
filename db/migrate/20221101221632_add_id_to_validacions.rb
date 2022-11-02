class AddIdToValidacions < ActiveRecord::Migration[7.0]
  def change
    add_column :validacions, :idS, :integer
  end
end
