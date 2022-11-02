class CreateValidacions < ActiveRecord::Migration[7.0]
  def change
    create_table :validacions do |t|

      t.timestamps
    end
  end
end
