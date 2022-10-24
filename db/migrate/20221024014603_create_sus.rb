class CreateSus < ActiveRecord::Migration[7.0]
  def change
    create_table :sus do |t|
      t.string :name
      t.string :surname
      t.integer :dni

      t.timestamps
    end
  end
end
