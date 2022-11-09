class DropValidacions < ActiveRecord::Migration[7.0]
  def change
    drop_table :validacions
  end
end
