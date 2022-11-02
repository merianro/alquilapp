class CreateValidations < ActiveRecord::Migration[7.0]
  def change
    create_table :validations do |t|
      t.integer :su_id

      t.timestamps
    end
  end
end
