class AddValidationReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :validations, :user
  end
end
