class AddPhoneToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone, :bigint
  end
end
